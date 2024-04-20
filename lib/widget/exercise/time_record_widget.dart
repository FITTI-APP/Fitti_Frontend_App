import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final hh = (duration.inHours).toString().padLeft(2, '0');
    final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final ss = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.0.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: '시작시간 : ',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat("hh시 mm분").format(startTime),
                            style: TextStyle(
                              fontSize: 11.sp,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: '종료시간 : ',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat("hh시 mm분").format(endTime),
                            style: TextStyle(
                              fontSize: 11.sp,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: '운동시간 : ',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                            text: '$hh:$mm:$ss',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
