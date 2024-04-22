import 'package:fitti_frontend_app/page/exercise/daily_routine_page.dart';
import 'package:fitti_frontend_app/class/exercise/my_exercise_home_page_chart_data.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/appbar/custom_appbar.dart';
import 'package:fitti_frontend_app/widget/common/diff_styled_text_widget.dart';
import 'package:fitti_frontend_app/widget/common/today_start_widget.dart';
import 'package:fitti_frontend_app/widget/common/week_calendar_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyExerciseHomePage extends StatefulWidget {
  const MyExerciseHomePage({super.key});

  @override
  State<MyExerciseHomePage> createState() => _MyExerciseHomePageState();
}

class _MyExerciseHomePageState extends State<MyExerciseHomePage>
    with TickerProviderStateMixin {
  late MyExerciseHomePageChartData myExerciseHomePageChartData;

  late List<String> body;

  late List<String> bodyKo;

  static const muscleMapFolderPath = "asset/muscle_map";
  String sex = "male";

  late TabController bodyExerciseTabController;

  @override
  void initState() {
    super.initState();

    bodyExerciseTabController = TabController(length: 6, vsync: this);

    // 주입
    myExerciseHomePageChartData = MyExerciseHomePageChartData();
    body = myExerciseHomePageChartData.body;
    bodyKo = myExerciseHomePageChartData.bodyKo;
  }

  @override
  Widget build(BuildContext context) {
    RadarChart radarChart = myExerciseHomePageChartData.getRadarChart();
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: customAppBar(
        "My Exercise",
        const [
          Icon(Icons.share),
          Icon(Icons.bar_chart),
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 20.h,
                  bottom: 10.h,
                ),
                child: diffStyledTextWidget("박진우", "님의 운동 분석"),
              ),
            ),
            TodayStartWidget(
                now: now,
                buttonText: "오늘 운동 시작하기",
                nextPage: DailyRoutinePage(
                  selectedDay: now,
                )),
            const WeekCalendarWidget(),
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                bottom: 10.h,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: SizedBox(
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: greenColor,
                        labelStyle: const TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.bold,
                        ),
                        labelPadding: EdgeInsets.zero,
                        onTap: (value) => setState(() {
                          bodyExerciseTabController.index = value;
                        }),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: [
                          for (final value in bodyKo)
                            Tab(
                              text: value,
                            )
                        ],
                        controller: bodyExerciseTabController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 280.h,
                            //이미지 불러오기
                            child: Image.asset(
                              '$muscleMapFolderPath/${sex}_${body[bodyExerciseTabController.index]}.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 280.h,
                            width: 180.w,
                            child: AspectRatio(
                              aspectRatio: 1.3,
                              child: radarChart,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                        ),
                        child: const Image(
                          image: AssetImage("asset/homepage/trophy.png"),
                        ),
                      ),
                      Text(
                        "친구들 중 나는 몇 등?",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
