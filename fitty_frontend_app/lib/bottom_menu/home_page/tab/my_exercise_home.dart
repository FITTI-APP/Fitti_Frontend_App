import 'package:flutter/material.dart';

import '../../../domain/plan/exercise/daily_routine_page.dart';

class MyExerciseHome extends StatelessWidget {
  const MyExerciseHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DailyRoutinePage()));
        },
        child: const Text('오늘의 운동 시작하기'),
      ),
    );
  }
}
