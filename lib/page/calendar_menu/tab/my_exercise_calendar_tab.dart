import 'package:fitty_frontend_app/data/my_exercise_record.dart';
import 'package:fitty_frontend_app/page/exercise/daily_routine_page.dart';
import 'package:fitty_frontend_app/widget/exercise/one_exercise_record_summary_widget.dart';
import 'package:fitty_frontend_app/widget/exercise/time_record_widget.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CalendarWidget(onDaySelectedHandler: (selectedDay) {
            setState(() => _selectedDay = selectedDay);
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DateFormat("MM월 dd일").format(_selectedDay),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Consumer<MyExerciseRecord>(
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
                      return OneExerciseRecordSummaryWidget(
                        exerciseRecord:
                            selectedDayExerciseRecord.oneExerciseRecords[index],
                      );
                    },
                  ),
                  TimeRecordWidget(
                      selectedDayExerciseRecord: selectedDayExerciseRecord)
                ],
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => DailyRoutinePage(
                  title: DateFormat("yyyy년 MM월 dd일").format(_selectedDay),
                  selectedDay: _selectedDay));
            },
            child: isDateTimeLaterThanToday(_selectedDay)
                ? const Text("계획하기")
                : const Text("편집하기"),
          )
        ],
      ),
    );
  }
}
