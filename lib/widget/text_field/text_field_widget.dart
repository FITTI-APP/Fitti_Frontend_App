import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  final bool isPassword;
  final String? prefixText;
  final VoidCallback? toggleVisibility;
  final bool isHidden;

  const TextFieldWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.hintText,
    required this.hintStyle,
    this.controller,
    this.isPassword = false,
    this.prefixText,
    this.toggleVisibility,
    this.isHidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextField(
        controller: controller,
        obscureText: isPassword && isHidden,
        decoration: InputDecoration(
          isDense: true, // Added for consistency in size
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.5.w,
            ),
            borderRadius: BorderRadius.circular(5.w),
          ),
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixText != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 32.w,
                      child: Text(
                        prefixText!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                      child: VerticalDivider(
                        width: 1.w,
                        thickness: 1.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: toggleVisibility,
                  icon: Icon(
                    isHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                    size: 15.w,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
