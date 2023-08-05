import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'domain/plan/exercise/all_exercise_record.dart';
import 'navigation_page.dart';

void main() async {
  await initializeDateFormatting();
  runApp(ChangeNotifierProvider(
    create: (context) => AllExerciseRecord(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
