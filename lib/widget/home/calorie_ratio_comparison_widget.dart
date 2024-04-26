import 'package:dotted_line/dotted_line.dart';
import 'package:fitti_frontend_app/page/home/home_page.dart';
import 'package:fitti_frontend_app/widget/home/pcf_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                const PcfBarChartWidget(carbohydrate: 45, protein: 30, fat: 25),
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
                const PcfBarChartWidget(carbohydrate: 45, protein: 35, fat: 20),
              ],
            ),
          ],
        )
      ],
    );
  }
}
