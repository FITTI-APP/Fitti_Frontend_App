import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Figma에서 흰색글씨 있는 버튼 위젯
// 버튼 동작 입력
// 버튼 너비 입력
// 버튼 높이 입력
// 버튼 배경색 입력
// 버튼 텍스트 입력

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    this.textColor = Colors.white,
    this.side = const BorderSide(
      color: greyColor,
    ),
    this.fontSize = 13,
  });

  final void Function() onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final BorderSide side;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          side: side,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
