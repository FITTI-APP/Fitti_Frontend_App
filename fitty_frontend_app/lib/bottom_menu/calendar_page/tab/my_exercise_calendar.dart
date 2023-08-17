import 'package:fitty_frontend_app/domain/exercise/all_exercise_record.dart';
import 'package:fitty_frontend_app/domain/exercise/page/daily_routine_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../calendar_widget.dart';
import '../../../domain/exercise/widget/volume_summary_widget.dart';

class MyExerciseCalendar extends StatefulWidget {
  const MyExerciseCalendar({super.key});

  @override
  State<MyExerciseCalendar> createState() => _MyExerciseCalendarState();
}

class _MyExerciseCalendarState extends State<MyExerciseCalendar> {
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
          Consumer<AllExerciseRecord>(
            builder: (context, allExerciseRecord, child) {
              var selectedDayExerciseRecord =
                  allExerciseRecord.getExerciseRecords(_selectedDay);
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedDayExerciseRecord.volumeRecords.length,
                itemBuilder: (context, index) {
                  return VolumeSummaryWidget(
                    exerciseRecord:
                        selectedDayExerciseRecord.volumeRecords[index],
                  );
                },
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
