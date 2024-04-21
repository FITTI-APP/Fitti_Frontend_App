import 'package:fitti_frontend_app/page/calendar_menu/tab/my_diet_calendar_tab.dart';
import 'package:fitti_frontend_app/page/calendar_menu/tab/my_exercise_calendar_tab.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: const Tab(
                text: "My 운동",
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: const Tab(
                text: "My 식단",
              ),
            ),
          ],
          labelPadding: EdgeInsets.zero,
          indicatorColor: greenColor,
          labelColor: greenColor,
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              MyExerciseCalendarTab(),
              MyDietCalendarTab(),
            ],
          ),
        ),
      ],
    );
  }
}
