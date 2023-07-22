import 'package:fitty_frontend_app/bottom_menu/calendar_page/tab/my_diet_calendar.dart';
import 'package:fitty_frontend_app/bottom_menu/calendar_page/tab/my_exercise_calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: [
            Container(
              height: 60,
              child: Tab(
                text: "My 운동",
              ),
            ),
            Container(
              height: 60,
              child: Tab(
                text: "My 식단",
              ),
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              MyExerciseCalendar(),
              MyDietCalendar(),
            ],
          ),
        ),
      ],
    );
  }
}
