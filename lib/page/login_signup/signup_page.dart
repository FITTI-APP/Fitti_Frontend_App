import 'package:fitti_frontend_app/data/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    color: Color.fromARGB(255, 6, 6, 6),
                    size: 100,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'F I T T I',
                    style: GoogleFonts.bebasNeue(fontSize: 50.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('회원 가입', style: GoogleFonts.bebasNeue(fontSize: 28)),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _userNameController,
                                validator: (val) =>
                                    val == "" ? "Please enter username " : null,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: 'User'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (val) =>
                                    val == "" ? "Please enter email" : null,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (val) =>
                                    val == "" ? "Please enter password" : null,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // 뭐가 나을 지 몰라서 일단 주석처리
                      // 주석 지우면 TextField의 validate가 작동, 주석처리하면 snackbar가 작동
                      // if (_formKey.currentState!.validate()) {
                      var authService = context.read<AuthService>();

                      authService.signUp(
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _userNameController.text,
                        onFail: (err) {
                          Get.snackbar("회원가입 실패", err);
                        },
                        onSuccess: () {
                          Get.snackbar("회원가입 성공", "로그인 페이지로 이동합니다.");
                          Future.delayed(
                            const Duration(seconds: 2),
                            () => Get.back(closeOverlays: true),
                          );
                        },
                      );
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('이미 등록하셨습니까?'),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Text(
                          ' 로그인 페이지로 돌아가기!',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
