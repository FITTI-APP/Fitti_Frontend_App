import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyDietCalendarTab extends StatelessWidget {
  const MyDietCalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2999, 12, 31),
      focusedDay: DateTime.now(),
      locale: 'ko_KR',
      daysOfWeekHeight: 30,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}
