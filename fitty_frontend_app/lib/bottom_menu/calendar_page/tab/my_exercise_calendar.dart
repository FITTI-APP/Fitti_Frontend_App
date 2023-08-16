import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../calendar_widget.dart';
import '../../../domain/exercise/widget/volume_summary_widget.dart';

class MyExerciseCalendar extends StatefulWidget {
  const MyExerciseCalendar({super.key});

  @override
  State<MyExerciseCalendar> createState() => _MyExerciseCalendarState();
}

class _MyExerciseCalendarState extends State<MyExerciseCalendar> {
  DateTime _selectedDay = DateTime.now();

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
          VolumeSummaryWidget(),
          VolumeSummaryWidget(),
        ],
      ),
    );
  }
}
