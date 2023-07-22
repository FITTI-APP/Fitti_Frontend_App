import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyExerciseCalendar extends StatefulWidget {
  const MyExerciseCalendar({super.key});

  @override
  State<MyExerciseCalendar> createState() => _MyExerciseCalendarState();
}

class _MyExerciseCalendarState extends State<MyExerciseCalendar> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2999, 12, 31),
            focusedDay: DateTime.now(),
            locale: 'ko_KR',
            daysOfWeekHeight: 30,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            }),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
                'day : ${_selectedDay != null ? DateFormat("yyyy-MM-dd").format(_selectedDay!) : 'Not Selected'}'),
          ),
        )
      ],
    );
  }
}
