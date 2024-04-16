import 'package:fitti_frontend_app/class/service/auth_service.dart';
import 'package:fitti_frontend_app/page/login_signup/signup_name_page.dart';
import 'package:fitti_frontend_app/page/menu_routing_page.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSaveLoginInfo = true;
  bool isHidden = true;
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
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                      ),
                    ),
                    SizedBox(height: 39.w),
                    SizedBox(
                      width: 212.w,
                      height: 34.h,
                      child: TextField(
                        controller: idController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.5.w,
                            ),
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          border: const OutlineInputBorder(),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 32.w,
                                child: Text(
                                  'ID',
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
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          // prefix 항상 보이게 고정
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h),
                    SizedBox(
                      width: 212.w,
                      height: 34.h,
                      child: TextField(
                        controller: pswController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.5.w,
                            ),
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          border: const OutlineInputBorder(),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 32.w,
                                child: Text(
                                  'PSW',
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
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          // prefix 항상 보이게 고정
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                              size: 15.w,
                            ),
                          ),
                        ),
                        obscureText: isHidden,
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
                            value: isSaveLoginInfo,
                            onChanged: (value) {
                              setState(() {
                                isSaveLoginInfo = value!;
                              });
                            },
                            side: BorderSide(width: 0.5.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.w),
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '로그인 유지',
                          style: TextStyle(
                            fontSize: 10.sp,
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
                            onSuccess: (token) async {
                              if (isSaveLoginInfo) {
                                await dotenv.load(
                                    fileName: 'asset/config/.env');
                                var tokenKey = dotenv.env['TOKEN_KEY']!;
                                await storage.write(
                                    key: tokenKey, value: token);
                              }
                              Get.off(() => MenuRoutingPage(token: token));
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                        ),
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
                      Get.to(() => const SignupNamePage());
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
                      width: 1.w,
                      thickness: 1.w,
                      color: Colors.black,
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
                        decoration: TextDecoration.underline,
                        color: Colors.black,
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
                        thickness: 1.w,
                        color: greyColor,
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
                        color: greyColor,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.w,
                        color: greyColor,
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
