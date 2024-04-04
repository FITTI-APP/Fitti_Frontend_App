import 'package:fitti_frontend_app/widget/common/today_start_widget.dart';
import 'package:fitti_frontend_app/widget/common/week_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/diet/diet_circle_graph_widget.dart';
import 'my_diet_today_diet_input.dart';

class MyDietHomePage extends StatefulWidget {
  const MyDietHomePage({super.key});

  @override
  State<MyDietHomePage> createState() => _MyDietHomePageState();
}

class _MyDietHomePageState extends State<MyDietHomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My 식단"),
      ),
      body: Column(
        children: [
          const Text("OOO님의 식단 분석"),
          TodayStartWidget(
            now: now,
            buttonText: "오늘 식단 추가하기",
            nextPage: MyDietTodayDietInput(datetime: now),
          ),
          SizedBox(
            height: 10.h,
          ),
          const WeekCalendarWidget(),
          Card(
            child: SizedBox(
              child: Column(
                children: [
                  DietCircleGraphWidget(
                    datetime: now,
                  ),
                  const Divider(),
                  const Text("현재 비율"),
                  const Text("목표 비율"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
