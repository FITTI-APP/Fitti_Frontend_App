import 'package:fitti_frontend_app/class/service/auth_service.dart';
import 'package:fitti_frontend_app/class/service/exercise_list_service.dart';
import 'package:fitti_frontend_app/page/login_signup/login_page.dart';
import 'package:fitti_frontend_app/page/menu_routing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'class/service/my_exercise_record_service.dart';
import 'page/intro_page.dart';

// ㅇㄹㄹㅇㄹ
void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyExerciseRecordService()),
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => ExerciseListProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          // 앱에서 지원하는 언어 목록을 설정
          Locale('ko', 'KR'), // 한국어
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shadowColor: Color.fromARGB(71, 0, 0, 0),
            elevation: 4,
          ),
          shadowColor: const Color(0x3F000000),
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!);
        },
        home: FutureBuilder(
          future: () async {
            try {
              WidgetsFlutterBinding.ensureInitialized();

              var myExerciseRecord = context.read<MyExerciseRecordService>();
              var exerciseListProvider = context.read<ExerciseListProvider>();

              await myExerciseRecord.initDateTimeToDayExerciseRecordMap();
              await exerciseListProvider.initExerciseList();

              await initializeDateFormatting();
              await dotenv.load(fileName: 'asset/config/.env');

              var userInfoKey = dotenv.env['USER_INFO']!;
              var userInfo = await storage.read(key: userInfoKey);
              if (userInfo != null) {
                return userInfo;
              }
              return "";
            } catch (e) {
              Text("Error2: $e");
              const Duration(seconds: 2);
              print(e); // 에러 출력
              rethrow; // 오류를 다시 던져서 FutureBuilder에서 잡을 수 있게 합니다.
            }
          }(),
          builder: (context, snapshot) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: _splashLoadingWidget(snapshot));
          },
        ),
      ),
    );
  }
}

Widget _splashLoadingWidget(AsyncSnapshot snapshot) {
  if (snapshot.hasError) {
    return Text("Error1: ${snapshot.error}");
  } else if (snapshot.hasData) {
    var userInfo = snapshot.data;
    if (userInfo != "") {
      // already logged in (token exists)
      return const MenuRoutingPage();
    } else {
      // not logged in (token does not exist)
      return MenuRoutingPage();
    }
  } else {
    // loading
    return const IntroPage();
  }
}
