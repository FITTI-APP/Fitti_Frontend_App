import 'package:fitty_frontend_app/widget/common/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widget/diet/diet_record_summary_widget.dart';
import '../../exercise/daily_routine_page.dart';

class MyDietCalendarTab extends StatefulWidget {
  const MyDietCalendarTab({super.key});

  @override
  State<MyDietCalendarTab> createState() => _MyDietCalendarTabState();
}

class _MyDietCalendarTabState extends State<MyDietCalendarTab> {
  List<String> mealNames = ["아침", "점심", "저녁"];
  List<String> foodNames = ["밥", "김치", "두부"];
  @override
  Widget build(BuildContext context) {
    DateTime _selectedDay = DateTime.now();
    bool isDateTimeLaterThanToday(DateTime dateTime) {
      DateTime currentDateWithoutTime = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);

      DateTime providedDateWithoutTime =
          DateTime(dateTime.year, dateTime.month, dateTime.day);

      return providedDateWithoutTime.isAfter(currentDateWithoutTime);
    }

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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mealNames.length,
          itemBuilder: (context, index) {
            return DietRecordSummaryWidget(
                mealName: mealNames[index], foodNames: foodNames);
          },
        ),
      ],
    ));
  }
}
