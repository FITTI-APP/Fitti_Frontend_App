import 'package:fitti_frontend_app/class/service/auth_service.dart';
import 'package:fitti_frontend_app/page/login_signup/signup_page.dart';
import 'package:fitti_frontend_app/page/menu_routing_page.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  final idController = TextEditingController();
  final pswController = TextEditingController();
  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 212.w,
                child: Column(
                  children: [
                    Text(
                      'FITTI',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                    SizedBox(height: 39.w),
                    SizedBox(
                      width: 212.w,
                      height: 34.h,
                      child: TextFormField(
                        controller: idController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(width: 0.5),
                          ),
                          labelText: 'ID',
                          labelStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h),
                    SizedBox(
                      width: 212.w,
                      height: 34.h,
                      child: TextFormField(
                        controller: pswController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 0.5,
                            ),
                          ),
                          labelText: 'PSW',
                          labelStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.w),
                    Row(
                      children: [
                        SizedBox(
                          // Checkbox 실제 사이즈가 18X18 인데 패딩이 커서 고정
                          height: 18,
                          width: 18,
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            side: BorderSide(width: 0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '로그인 유지',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h),
                    SizedBox(
                      width: 212.w,
                      height: 34.h,
                      child: ElevatedButton(
                        onPressed: () {
                          var authService = context.read<AuthService>();
                          authService.signIn(
                            email: idController.text,
                            password: pswController.text,
                            onFail: (err) {
                              Get.snackbar("로그인 실패", err);
                            },
                            onSuccess: (val) async {
                              await storage.write(key: "userInfo", value: val);
                              Get.off(() => const MenuRoutingPage());
                            },
                          );
                        },
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            color: whiteColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignupPage());
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    height: 10.h,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      '찾기',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        decoration: TextDecoration.underline,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              SizedBox(
                width: 262.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: grayColor,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      '간편 로그인',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: grayColor,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: grayColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 9.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'asset/login_icon/google.png',
                      width: 33.w,
                      height: 33.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'asset/login_icon/kakao.png',
                      width: 33.w,
                      height: 33.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'asset/login_icon/naver.png',
                      width: 33.w,
                      height: 33.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ClipOval(
                      child: Image.asset(
                        'asset/login_icon/facebook.png',
                        width: 33.w,
                        height: 33.w,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
