import 'package:dotted_line/dotted_line.dart';
import 'package:fitti_frontend_app/page/diet/my_diet_home_page.dart';
import 'package:fitti_frontend_app/page/exercise/my_exercise_home_page.dart';
import 'package:fitti_frontend_app/class/home_page_chart_data.dart';
import 'package:fitti_frontend_app/page/home_page/my_home_widget.dart';
import 'package:fitti_frontend_app/page/home_page/pcf_bar_chart.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BarChart barChart = HomePageChartData().getMyExerciseBarChart();
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("OOO님 안녕하세요!"),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("여러분의 건강도우미 FITTI입니다."),
        ),
        const Card(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("금주의 3대 1위는?"),
                Text("정재현님"),
              ],
            ),
          ),
        ),
        Row(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("지난 1주일 동안 정재현님의 기록입니다."),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 20),
                    padding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "이번 달 조회하기",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
        MyHomeWidget(
          title: "My 운동",
          nextPage: const MyExerciseHomePage(),
          body: Padding(
            padding: EdgeInsets.only(top: 21.h, left: 28.w),
            child: Row(
              children: [
                SizedBox(width: 129.w, height: 87.h, child: barChart),
                SizedBox(width: 27.w),
                Text.rich(
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.36,
                  ),
                  const TextSpan(
                    children: [
                      TextSpan(
                        text: '총 볼륨 : ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '19045',
                        style: TextStyle(
                          color: greenColor,
                        ),
                      ),
                      TextSpan(
                        text: ' kg\n총 세트 : ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '2974',
                        style: TextStyle(
                          color: greenColor,
                        ),
                      ),
                      TextSpan(
                        text: ' 세트',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        MyHomeWidget(
          title: "My 식단",
          nextPage: const MyDietHomePage(),
          body: Padding(
            padding: EdgeInsets.only(top: 22.h, left: 20.w),
            child: Row(
              children: [
                Container(
                  width: 81.w,
                  height: 81.w,
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: const Color(0xFFD9D9D9),
                          width: 4.26.w,
                        ),
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white),
                  child: Center(
                    child: Text.rich(
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        color: greenColor,
                      ),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '2350',
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                          TextSpan(
                            text: '\n',
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'kcal',
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                CalorieRatioComparisonWidget(
                  currentPgfValue:
                      PgfValue(carbohydrate: 45, protein: 30, fat: 25),
                  goalPgfValue:
                      PgfValue(carbohydrate: 45, protein: 35, fat: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CalorieRatioComparisonWidget extends StatelessWidget {
  const CalorieRatioComparisonWidget(
      {super.key, required this.currentPgfValue, required this.goalPgfValue});

  final PgfValue currentPgfValue;
  final PgfValue goalPgfValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32.69.w, top: 10.h),
          child: SizedBox(
            width: 181.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 5; i++)
                  Column(
                    children: [
                      DottedLine(
                        direction: Axis.vertical,
                        lineLength: 51.23.h,
                        lineThickness: 1.5.w,
                        dashLength: 4.h,
                        dashGapLength: 2.h,
                      ),
                      SizedBox(
                        height: 4.8.h,
                      ),
                      Text(
                        "${i * 25}",
                        style: TextStyle(
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 13.54.h),
            Row(
              children: [
                Text("현재비율", style: TextStyle(fontSize: 8.sp)),
                SizedBox(
                  width: 6.w,
                ),
                PcfBarChart(carbohydrate: 45, protein: 30, fat: 25),
              ],
            ),
            SizedBox(
              height: 20.27.h,
            ),
            Row(
              children: [
                Text("목표비율", style: TextStyle(fontSize: 8.sp)),
                SizedBox(
                  width: 6.w,
                ),
                PcfBarChart(carbohydrate: 45, protein: 35, fat: 20),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class PgfValue {
  final double carbohydrate;
  final double protein;
  final double fat;

  PgfValue({this.carbohydrate = 0, this.protein = 0, this.fat = 0});
}
