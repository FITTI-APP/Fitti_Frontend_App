import 'package:fitti_frontend_app/page/exercise/daily_routine_page.dart';
import 'package:fitti_frontend_app/widget/common/today_start_widget.dart';
import 'package:fitti_frontend_app/widget/common/week_calendar_widget.dart';
import 'package:flutter/material.dart';

class MyExerciseHomePage extends StatefulWidget {
  const MyExerciseHomePage({super.key});

  @override
  State<MyExerciseHomePage> createState() => _MyExerciseHomePageState();
}

class _MyExerciseHomePageState extends State<MyExerciseHomePage>
    with TickerProviderStateMixin {
  final upperBodyKo = [
    "가슴",
    "등",
    "어깨",
    "삼두",
    "이두",
    "전완",
    "복근",
  ];

  final upperBody = [
    "chest",
    "back",
    "shoulders",
    "triceps",
    "biceps",
    "forearms",
    "abs",
  ];

  final lowerBodyKo = [
    "허벅지",
    "종아리",
    "엉덩이",
  ];

  final lowerBody = [
    "thighs",
    "calves",
    "glutes",
  ];

  static const muscleMapFolderPath = "asset/muscle_map";
  String sex = "male";

  bool get isUpperBody => upperOrLowerTabController.index == 0;
  late TabController upperOrLowerTabController;
  late TabController upperExerciseTabController;
  late TabController lowerExerciseTabController;

  @override
  void initState() {
    super.initState();
    upperOrLowerTabController = TabController(length: 2, vsync: this);
    upperExerciseTabController = TabController(length: 7, vsync: this);
    lowerExerciseTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My 운동"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("OOO님의 운동 분석"),
            TodayStartWidget(
                now: now,
                buttonText: "오늘 운동 시작하기",
                nextPage: DailyRoutinePage(
                  selectedDay: now,
                  title: "My 운동",
                )),
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
                        Expanded(
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
                            tabs: const [
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
                          child: Container(),
                        ),
                      ],
                    ),
                    if (isUpperBody)
                      TabBar(
                        onTap: (value) => setState(() {
                          upperExerciseTabController.index = value;
                        }),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: [
                          for (final value in upperBodyKo)
                            Tab(
                              text: value,
                            )
                        ],
                        controller: upperExerciseTabController,
                      )
                    else
                      TabBar(
                        onTap: (value) => setState(() {
                          lowerExerciseTabController.index = value;
                        }),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: [
                          for (final value in lowerBodyKo)
                            Tab(
                              text: value,
                            )
                        ],
                        controller: lowerExerciseTabController,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 280,
                          //이미지 불러오기
                          child: Image.asset(
                            '$muscleMapFolderPath/${sex}_${isUpperBody ? upperBody[upperExerciseTabController.index] : lowerBody[lowerExerciseTabController.index]}.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 280,
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
      ),
    );
  }
}
