import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

RichText diffStyledTextWidget(
  String prefixText,
  String suffixText,
) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: prefixText,
          style: TextStyle(
            // 접두사 스타일 지정
            fontSize: 17.sp,
            color: greenColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: suffixText,
          style: TextStyle(
            // 접미사 스타일 지정
            fontSize: 17.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
