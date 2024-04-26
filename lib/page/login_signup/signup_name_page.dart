import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/button/main_button_widget.dart';
import 'package:fitti_frontend_app/widget/text_field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupNamePage extends StatelessWidget {
  const SignupNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 33.h,
                bottom: 5.h,
              ),
              child: Text(
                '사용자 이름 입력',
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '나중에 언제든지 변경 가능합니다.',
              style: TextStyle(
                fontSize: 11.sp,
                color: greyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 23.h,
                bottom: 16.h,
              ),
              child: TextFieldWidget(
                width: 296,
                height: 38,
                hintText: '사용자 이름',
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
                isPassword: false,
              ),
            ),
            MainButtonWidget(
              onPressed: () {
                // Handle next button press
              },
              width: 296,
              height: 38,
              backgroundColor: Colors.black,
              text: "다음",
            ),
          ],
        ),
      ),
    );
  }
}
