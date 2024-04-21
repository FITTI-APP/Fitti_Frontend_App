import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupNamePage extends StatelessWidget {
  const SignupNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 33.h),
            Text(
              '사용자 이름 입력',
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '나중에 언제든지 변경 가능합니다.',
              style: TextStyle(
                fontSize: 11.sp,
                color: greyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 23.h),
            TextFieldWidget(
              width: 296,
              height: 38,
              hintText: '사용자 이름',
              hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
              isPassword: false,
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {
                  // Handle next button press
                },
                child: const Text(
                  '다음',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
