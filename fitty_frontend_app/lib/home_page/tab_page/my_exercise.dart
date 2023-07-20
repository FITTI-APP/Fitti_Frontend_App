import 'package:flutter/material.dart';

import '../../domain/plan/exercise/exercise_plan_page.dart';

class MyExercise extends StatelessWidget {
  const MyExercise({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ExercisePlan()));
        },
        child: const Text('오늘의 운동 시작하기'),
      ),
    );
  }
}
