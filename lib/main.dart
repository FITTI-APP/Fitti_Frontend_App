import 'package:fitti_frontend_app/data/auth_service.dart';
import 'package:fitti_frontend_app/page/login_signup/login_page.dart';
import 'package:fitti_frontend_app/page/menu_routing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'data/my_exercise_record.dart';
import 'page/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyExerciseRecord()),
      ChangeNotifierProvider(create: (context) => AuthService()),
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
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: () async {
          var myExerciseRecord = context.read<MyExerciseRecord>();
          await myExerciseRecord.initDateTimeToDayExerciseRecordMap();
          await initializeDateFormatting();
          await dotenv.load(fileName: 'asset/config/.env');

          var userInfo = await storage.read(key: "userInfo");
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

Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
  if (snapshot.hasError) {
    return const Text("Error!!");
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
