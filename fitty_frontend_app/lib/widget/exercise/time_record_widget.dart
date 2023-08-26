import 'package:fitty_frontend_app/data/all_exercise_record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeRecordWidget extends StatelessWidget {
  const TimeRecordWidget({
    super.key,
    required this.exerciseRecord,
  });

  final OneExerciseRecord exerciseRecord;

  @override
  Widget build(BuildContext context) {
    var selectedDayExerciseRecord =
        Provider.of<AllExerciseRecord>(context, listen: false)
            .getDayExerciseRecord(DateTime.now());

    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Center(
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Text('시작시간 : ${selectedDayExerciseRecord.startTime}'),
                    Text('종료시간 : ${selectedDayExerciseRecord.endTime}'),
                    Text(
                        '운동시간 : ${selectedDayExerciseRecord.exerciseDuration}'),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
