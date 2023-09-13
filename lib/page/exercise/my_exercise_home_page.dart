import 'package:fitti_frontend_app/widget/common/today_start_widget.dart';
import 'package:flutter/material.dart';

class MyExerciseHomePage extends StatelessWidget {
  MyExerciseHomePage({super.key});

  final upperBody = [
    "가슴",
    "등",
    "어깨",
    "삼두",
    "이두",
    "전완",
    "복근",
  ];
  final lowerBody = [
    "허벅지",
    "햄스트링",
    "종아리",
    "엉덩이",
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My 운동"),
      ),
      body: Column(
        children: [
          const Text("OOO님의 운동 분석"),
          TodayStartWidget(
            now: now,
            buttonText: "오늘 운동 시작하기",
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: SizedBox(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("상체"),
                      Text("하체"),
                    ],
                  ),
                  Row(
                    children: [for (final value in upperBody) Text(value)],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Center(child: Text("그림")),
                      ),
                      SizedBox(
                        height: 100,
                        child: Center(child: Text("그래프")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Card(
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Text("친구들 중 나는 몇 등?"),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_right),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
