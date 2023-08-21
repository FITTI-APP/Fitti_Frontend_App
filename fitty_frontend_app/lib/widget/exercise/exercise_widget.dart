import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    super.key,
    required this.exerciseName,
    required this.index,
  });
  final String exerciseName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exerciseName),
      onTap: () {
        Navigator.pop(context, exerciseName);
      },
    );
  }
}
