import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
    required this.onDaySelectedHandler,
  });

  final Function(DateTime) onDaySelectedHandler;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
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
      child: TableCalendar(
          // 캘린더가 SingleScrollView 에서 수직 스크롤 안되는 문제 해결
          availableGestures: AvailableGestures.horizontalSwipe,
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
            widget.onDaySelectedHandler(selectedDay);
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }),
    );
  }
}
