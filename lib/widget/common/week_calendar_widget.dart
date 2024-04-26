import 'package:fitti_frontend_app/widget/button/bordered_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekCalendarWidget extends StatefulWidget {
  const WeekCalendarWidget({super.key});

  @override
  State<WeekCalendarWidget> createState() => _WeekCalendarWidgetState();
}

class _WeekCalendarWidgetState extends State<WeekCalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  int getWeekNumberOfMonth(DateTime date) {
    var weekday = date.weekday;
    if (weekday == 7) weekday = 0;
    return ((date.day + 6 - weekday) / 7).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            TextButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _focusedDay,
                  firstDate: DateTime.utc(2000, 1, 1),
                  lastDate: DateTime.utc(2999, 12, 31),
                );
                if (picked != null && picked != _focusedDay) {
                  setState(() {
                    _focusedDay = picked;
                  });
                }
              },
              child: Text.rich(
                TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    text:
                        "${_focusedDay.month}월 ${getWeekNumberOfMonth(_focusedDay)}주차",
                    children: const [
                      WidgetSpan(
                          child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ))
                    ]),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SizedBox(
                height: 23.h,
                child: BorderedButtonWidget(
                    onTodayPressed: () {
                      setState(() {
                        _focusedDay = DateTime.now();
                      });
                    },
                    text: "이번주 조회하기"),
              ),
            )
          ],
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
                child: TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2999, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (isSameDay(_selectedDay, selectedDay)) {
                    _selectedDay = null;
                  } else {
                    _selectedDay = selectedDay;
                  }

                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      date.day.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Color(0xff7f7f7f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xff0c9500),
                        ),
                      ),
                    ),
                    child: Text(
                      date.day.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Color(0xff0c9500),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                todayBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      date.day.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              calendarFormat: CalendarFormat.week,
              daysOfWeekVisible: true,
              headerVisible: false,
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    DateFormat.E(locale).format(date).toUpperCase(),
                weekdayStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7f7f7f),
                ),
                weekendStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7f7f7f),
                ),
              ),
            )),
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
