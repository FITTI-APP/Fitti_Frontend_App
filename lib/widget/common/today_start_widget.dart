import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/button/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodayStartWidget extends StatelessWidget {
  const TodayStartWidget({
    super.key,
    required this.now,
    required this.buttonText,
    required this.nextPage,
  });

  final DateTime now;
  final String buttonText;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: shadowColor,
      elevation: 4.r,
      child: Padding(
        padding: EdgeInsets.only(
          top: 13.665.h,
          left: 21.5.w,
          right: 21.5.w,
          bottom: 13.665.h,
        ),
        child: SizedBox(
          height: 49.39.h,
          width: 296.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('MM/dd\nEEEE', 'ko').format(now),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.w,
                  right: 32.w,
                ),
                child: const VerticalDivider(
                  thickness: 2,
                  color: shadowColor,
                ),
              ),
              MainButtonWidget(
                onPressed: () {
                  Get.to(nextPage);
                },
                width: 193,
                height: 43,
                backgroundColor: startButtonColor,
                text: "오늘 운동 시작하기",
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
