import 'package:fitti_frontend_app/class/service/my_exercise_record_service.dart';
import 'package:fitti_frontend_app/page/exercise/daily_routine_page.dart';
import 'package:fitti_frontend_app/widget/exercise/one_exercise_record_summary_widget.dart';
import 'package:fitti_frontend_app/widget/exercise/time_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../widget/common/calendar_widget.dart';

class MyExerciseCalendarTab extends StatefulWidget {
  const MyExerciseCalendarTab({super.key});

  @override
  State<MyExerciseCalendarTab> createState() => _MyExerciseCalendarTabState();
}

class _MyExerciseCalendarTabState extends State<MyExerciseCalendarTab> {
  DateTime _selectedDay = DateTime.now();
  bool isDateTimeLaterThanToday(DateTime dateTime) {
    DateTime currentDateWithoutTime =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    DateTime providedDateWithoutTime =
        DateTime(dateTime.year, dateTime.month, dateTime.day);

    return providedDateWithoutTime.isAfter(currentDateWithoutTime);
  }

  bool isDateTimeEqualToToday(DateTime dateTime) {
    DateTime currentDateWithoutTime =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    DateTime providedDateWithoutTime =
        DateTime(dateTime.year, dateTime.month, dateTime.day);

    return providedDateWithoutTime.isAtSameMomentAs(currentDateWithoutTime);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: CalendarWidget(onDaySelectedHandler: (selectedDay) {
              setState(() => _selectedDay = selectedDay);
            }),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            DateFormat("MM월 dd일").format(_selectedDay),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Consumer<MyExerciseRecordService>(
            builder: (context, allExerciseRecord, child) {
              var selectedDayExerciseRecord =
                  allExerciseRecord.getDayExerciseRecord(_selectedDay);
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        selectedDayExerciseRecord.oneExerciseRecords.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: OneExerciseRecordSummaryWidget(
                              exerciseRecord: selectedDayExerciseRecord
                                  .oneExerciseRecords[index],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          )
                        ],
                      );
                    },
                  ),
                  TimeRecordWidget(
                      selectedDayExerciseRecord: selectedDayExerciseRecord)
                ],
              );
            },
          ),
          SizedBox(
            height: 11.h,
          ),
          SizedBox(
            width: 86.w,
            height: 34.h,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => DailyRoutinePage(
                    title: DateFormat("yyyy년 MM월 dd일").format(_selectedDay),
                    selectedDay: _selectedDay));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              child: () {
                //todo : 확정 아님
                if (isDateTimeLaterThanToday(_selectedDay)) {
                  return const Text('계획하기');
                } else if (isDateTimeEqualToToday(_selectedDay)) {
                  return const Text('시작하기');
                } else {
                  return const Text('수정하기');
                }
              }(),
            ),
          )
        ],
      ),
    );
  }
}
