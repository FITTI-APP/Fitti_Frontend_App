import 'package:fitti_frontend_app/class/service/auth_service.dart';
import 'package:fitti_frontend_app/class/service/exercise_list_service.dart';
import 'package:fitti_frontend_app/page/login_signup/login_page.dart';
import 'package:fitti_frontend_app/page/menu_routing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'class/service/my_exercise_record_service.dart';
import 'page/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return GetMaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        // 앱에서 지원하는 언어 목록을 설정
        Locale('ko', 'KR'), // 한국어
      ],
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: () async {
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
        }(),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: _splashLoadingWidget(snapshot));
        },
      ),
    );
  }
}

Widget _splashLoadingWidget(AsyncSnapshot snapshot) {
  if (snapshot.hasError) {
    return Text("Error(snapshot): ${snapshot.error}");
  } else if (snapshot.hasData) {
    var userInfo = snapshot.data;
    // todo : userInfo 검증 필요
    if (userInfo != "") {
      return const MenuRoutingPage();
    }
    return const LoginPage();
  } else {
    return const IntroPage();
  }
}
