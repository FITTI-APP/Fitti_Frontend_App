import 'package:fitti_frontend_app/widget/common/today_start_widget.dart';
import 'package:fitti_frontend_app/widget/common/week_calendar_widget.dart';
import 'package:flutter/material.dart';

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
            nextPage: const Text("오늘 식단 추가하기"),
          ),
          const SizedBox(
            height: 10,
          ),
          const WeekCalendarWidget(),
          Card(
            child: SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          children: [
                            Text("오늘 섭취량"),
                            Text("2350 Kcal"),
                          ],
                        ),
                      )
                    ],
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
