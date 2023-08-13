import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyExerciseCalendar extends StatefulWidget {
  const MyExerciseCalendar({super.key});

  @override
  State<MyExerciseCalendar> createState() => _MyExerciseCalendarState();
}

class _MyExerciseCalendarState extends State<MyExerciseCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2999, 12, 31),
            focusedDay: _focusedDay,
            locale: 'ko_KR',
            daysOfWeekHeight: 30,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }),
        Center(
          child: TextButton(
            onPressed: () {},
            child:
                Text('day : ${DateFormat("yyyy-MM-dd").format(_selectedDay)}'),
          ),
        )
      ],
    );
  }
}
