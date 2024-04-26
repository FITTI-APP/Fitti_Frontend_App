import 'package:fitti_frontend_app/page/diet/my_diet_home_page.dart';
import 'package:fitti_frontend_app/page/exercise/my_exercise_home_page.dart';
import 'package:fitti_frontend_app/class/home_page_chart_data.dart';
import 'package:fitti_frontend_app/widget/home/calorie_ratio_comparison_widget.dart';
import 'package:fitti_frontend_app/widget/home/my_home_widget.dart';
import 'package:fitti_frontend_app/widget/home/who_week_ranking_widget.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        const WhoWeekRankingWidget(),
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
                  child: Text(
                    "이번 달 조회하기",
                    style: TextStyle(fontSize: 10.sp),
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
        SizedBox(height: 10.h),
        MyHomeWidget(
          title: "My 식단",
          nextPage: const MyDietHomePage(),
          body: Padding(
            padding: EdgeInsets.only(top: 22.h, left: 20.w),
            child: Row(
              children: [
                Container(
                  width: 81.w,
                  height: 81.h,
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

class PgfValue {
  final double carbohydrate;
  final double protein;
  final double fat;

  PgfValue({this.carbohydrate = 0, this.protein = 0, this.fat = 0});
}
