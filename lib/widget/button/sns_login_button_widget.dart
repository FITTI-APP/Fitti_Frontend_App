import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// SNS 로그인 버튼
// 이미지 경로 입력

class SNSLoginButtonWidget extends StatelessWidget {
  const SNSLoginButtonWidget({
    super.key,
    required this.iconPath,
  });

  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Image.asset(
        iconPath,
        width: 33.w,
        height: 33.w,
      ),
    );
  }
}
