import 'package:fitti_frontend_app/widget/common/today_start_widget.dart';
import 'package:flutter/material.dart';

class MyExerciseHomePage extends StatefulWidget {
  MyExerciseHomePage({super.key});

  @override
  State<MyExerciseHomePage> createState() => _MyExerciseHomePageState();
}

class _MyExerciseHomePageState extends State<MyExerciseHomePage>
    with TickerProviderStateMixin {
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

  bool get isUpperBody => upperOrLowerTabController.index == 0;
  late TabController upperOrLowerTabController;
  late TabController upperExerciseTabController;
  late TabController lowerExerciseTabController;

  @override
  void initState() {
    super.initState();
    upperOrLowerTabController = TabController(length: 2, vsync: this);
    upperExerciseTabController = TabController(length: 7, vsync: this);
    lowerExerciseTabController = TabController(length: 4, vsync: this);
  }

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
                  Row(
                    children: [
                      Expanded(
                        // flex: 5,
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          onTap: (index) {
                            setState(() {
                              upperExerciseTabController.index = 0;
                              lowerExerciseTabController.index = 0;
                            });
                          },
                          controller: upperOrLowerTabController,
                          tabs: [
                            Tab(
                              text: "상체",
                            ),
                            Tab(
                              text: "하체",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        // flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  if (isUpperBody)
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      tabs: [
                        for (final value in upperBody)
                          Tab(
                            text: value,
                          )
                      ],
                      controller: upperExerciseTabController,
                    )
                  else
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      tabs: [
                        for (final value in lowerBody)
                          Tab(
                            text: value,
                          )
                      ],
                      controller: lowerExerciseTabController,
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
