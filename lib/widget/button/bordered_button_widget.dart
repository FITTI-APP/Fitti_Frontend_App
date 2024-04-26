import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTodayPressed;

  const BorderedButtonWidget({
    Key? key,
    required this.onTodayPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: Size(80.w, 23.h),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 0.5.w,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTodayPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
