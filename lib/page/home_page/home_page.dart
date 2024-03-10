import 'package:fitti_frontend_app/page/diet/my_diet_home_page.dart';
import 'package:fitti_frontend_app/page/exercise/my_exercise_home_page.dart';
import 'package:fitti_frontend_app/class/home_page_chart_data.dart';
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
                  const Expanded(
                    child: Center(
                      child: Text("차트"),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({
    super.key,
    required this.title,
    required this.nextPage,
    required this.body,
  });

  final String title;
  final Widget nextPage;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 170.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
          )
        ],
      ),
      child: SizedBox(
        child: Center(
            child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 14.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 29.w,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Container(
                          width: 227.w,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 267.w,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => nextPage);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        child: Row(
                          children: [
                            Text(
                              "자세히 보기",
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: greyColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 10.w,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            body,
          ],
        )),
      ),
    );
  }
}
