import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../class/exercise/day_exercise_record.dart';

class TimeRecordWidget extends StatelessWidget {
  const TimeRecordWidget({
    super.key,
    required this.selectedDayExerciseRecord,
  });

  final DayExerciseRecord selectedDayExerciseRecord;

  @override
  Widget build(BuildContext context) {
    if (selectedDayExerciseRecord.state != DayExerciseRecordState.end) {
      return const Text('운동을 시작해주세요');
    }
    var startTime = selectedDayExerciseRecord.startTime;
    var endTime = selectedDayExerciseRecord.endTime;
    var duration = selectedDayExerciseRecord.exerciseDuration;
    final HH = (duration.inHours).toString().padLeft(2, '0');
    final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final ss = (duration.inSeconds % 60).toString().padLeft(2, '0');

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
                child: Column(
                  children: [
                    Text('시작시간 : ${DateFormat("hh시 mm분").format(startTime)}'),
                    Text('종료시간 : ${DateFormat("hh시 mm분").format(endTime)}'),
                    Text('운동시간 : $HH:$mm:$ss'),
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
