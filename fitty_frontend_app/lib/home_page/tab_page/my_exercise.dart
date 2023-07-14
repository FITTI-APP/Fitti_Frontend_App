import 'package:fitty_frontend_app/home_page/tab_page/my_fitty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/plan/exercise/exercise_plan_page.dart';

class MyExercise extends StatelessWidget {
  const MyExercise({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ExercisePlan()));
          },
          child: Text('오늘의 운동 시작하기'),
        ),
      ),
    );
  }
}
