import 'package:fitti_frontend_app/class/service/auth_service.dart';
import 'package:fitti_frontend_app/page/login_signup/signup_name_page.dart';
import 'package:fitti_frontend_app/page/menu_routing_page.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/button/main_button_widget.dart';
import 'package:fitti_frontend_app/widget/button/sns_login_button_widget.dart';
import 'package:fitti_frontend_app/widget/text_field/text_field_widget.dart';
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

  List<String> snsList = [
    'google',
    // 'kakao',
    'naver',
    'facebook',
  ];

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
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 7.h,
                        top: 39.h,
                      ),
                      child: TextFieldWidget(
                        width: 212,
                        height: 34,
                        hintText: '',
                        hintStyle: const TextStyle(),
                        controller: idController,
                        isPassword: false,
                        prefixText: 'ID',
                      ),
                    ),
                    TextFieldWidget(
                      width: 212,
                      height: 34,
                      hintText: '',
                      hintStyle: const TextStyle(),
                      controller: pswController,
                      isPassword: true,
                      prefixText: 'PW',
                      isHidden: isHidden,
                      toggleVisibility: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.h,
                        bottom: 19.h,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            // Checkbox 실제 사이즈가 18X18 인데 패딩이 커서 고정
                            height: 18,
                            width: 18,
                            child: Checkbox(
                              value: isSaveLoginInfo,
                              onChanged: (value) {
                                //todo check box 잘못 만듬
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
                    ),
                    MainButtonWidget(
                      width: 212,
                      height: 34,
                      backgroundColor: Colors.black,
                      text: '로그인',
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
                              await dotenv.load(fileName: 'asset/config/.env');
                              var tokenKey = dotenv.env['TOKEN_KEY']!;
                              await storage.write(key: tokenKey, value: token);
                            }
                            Get.off(() => MenuRoutingPage(token: token));
                          },
                        );
                      },
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                    ),
                    child: SizedBox(
                      height: 10.h,
                      child: VerticalDivider(
                        width: 1.w,
                        thickness: 1.w,
                        color: Colors.black,
                      ),
                    ),
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
              const SimpleLoginLineWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: snsList.map((sns) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SNSLoginButtonWidget(
                      iconPath: 'asset/login_icon/$sns.png',
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleLoginLineWidget extends StatelessWidget {
  const SimpleLoginLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 7.h,
        bottom: 9.h,
      ),
      child: SizedBox(
        width: 262.w,
        child: Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1.w,
                color: greyColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child: Text(
                '간편 로그인',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: greyColor,
                ),
              ),
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
    );
  }
}
