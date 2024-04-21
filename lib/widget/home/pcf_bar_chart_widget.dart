import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PcfBarChartWidget extends StatelessWidget {
  const PcfBarChartWidget(
      {super.key,
      required this.carbohydrate,
      required this.protein,
      required this.fat});

  //kcal
  final double carbohydrate;
  final double protein;
  final double fat;

  @override
  Widget build(BuildContext context) {
    const width = 172.0;

    double total = (carbohydrate + protein + fat) != 0
        ? (carbohydrate + protein + fat)
        : 1.0;
    double carbohydrateProportion = carbohydrate / total;
    double proteinProportion = protein / total;
    double fatProportion = fat / total;

    double carbohydrateWidth = width * carbohydrateProportion;
    double proteinWidth = width * proteinProportion;
    double fatWidth = width * fatProportion;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: blueColor,
                ),
                width: carbohydrateWidth.w,
                height: 4.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: greenColor,
                ),
                width: proteinWidth.w,
                height: 4.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: redColor,
                ),
                width: fatWidth.w,
                height: 4.h,
              ),
            ],
          ),
        ),
        Positioned(
          right: proteinWidth.w + fatWidth.w + 2.w,
          child: Text(
            "${(carbohydrateProportion * 100).toInt()}",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          right: fatWidth.w + 2.w,
          child: Text(
            "${(proteinProportion * 100).toInt()}",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          right: 2.w,
          child: Text(
            "${(fatProportion * 100).toInt()}",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
