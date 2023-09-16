import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekCalendarWidget extends StatefulWidget {
  const WeekCalendarWidget({super.key});

  @override
  State<WeekCalendarWidget> createState() => _WeekCalendarWidgetState();
}

class _WeekCalendarWidgetState extends State<WeekCalendarWidget> {
  DateTime _focusedDay = DateTime.now();

  int getWeekNumberOfMonth(DateTime date) {
    var weekday = date.weekday;
    if (weekday == 7) weekday = 0;
    return ((date.day + 6 - weekday) / 7).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${_focusedDay.month}월 ${getWeekNumberOfMonth(_focusedDay)}주차",
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _focusedDay = _focusedDay.subtract(const Duration(days: 7));
                });
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: TableCalendarBase(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2999, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: CalendarFormat.week,
                dayBuilder: (context, date, _) {
                  return Text(
                    "${DateFormat.d().format(date)}\n${DateFormat.E().format(date).toUpperCase()}",
                    textAlign: TextAlign.center,
                  );
                },
                dowVisible: false,
                rowHeight: 50,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _focusedDay = _focusedDay.add(const Duration(days: 7));
                });
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}
