import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 커스텀 검색 텍스트 필드 위젯
class SearchTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;

  const SearchTextField({
    Key? key,
    required this.onChanged,
    this.hintText = '검색', // 기본 힌트 텍스트는 '검색'으로 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      height: 43.52.h,
      decoration: BoxDecoration(
        color: shadowButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10.w, bottom: 10.h),
          border: InputBorder.none,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
