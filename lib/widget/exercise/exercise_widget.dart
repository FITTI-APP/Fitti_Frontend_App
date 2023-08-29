import 'package:fitty_frontend_app/widget/exercise/one_exercise_records_of_all_date_widget.dart';
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
      leading: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: SizedBox(
                      width: double.infinity,
                      height: 550,
                      child: OneExerciseRecordsOfAllDateWidget(
                        exersiseName: exerciseName,
                      ),
                    ),
                  ));
        },
        icon: const Icon(Icons.calendar_view_month),
      ),
      title: Text(exerciseName),
      onTap: () {
        Navigator.pop(context, exerciseName);
      },
    );
  }
}
