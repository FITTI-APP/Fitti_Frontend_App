import 'package:fitti_frontend_app/data/auth_service.dart';
import 'package:fitti_frontend_app/page/login_signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../menu_routing_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? userInfo = "";
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userInfo = await storage.read(key: "userInfo");
    // todo : userInfo 검증 필요
    // todo : 그냥 LoginPage안거치고 바로 MenuRoutingPage로 가는게 나을 듯
    if (userInfo != null) {
      Get.off(() => const MenuRoutingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 213, 213),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.fitness_center_outlined,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'F I T T I',
                    style: GoogleFonts.bebasNeue(fontSize: 60.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '당신의 피트니스 친구',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                controller: _emailController,
                                validator: (val) =>
                                    val == "" ? "Please enter email" : null,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: '이메일'),
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
                                    border: InputBorder.none, hintText: '비밀번호'),
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
                      var authService = context.read<AuthService>();
                      authService.signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                          onFail: (err) {
                            Get.snackbar("로그인 실패", err);
                          },
                          onSuccess: (val) async {
                            await storage.write(key: "userInfo", value: val);
                            Get.off(() => const MenuRoutingPage());
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 25, 42, 173),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            '로그인',
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
                      const Text('회원이 아니십니까?'),
                      GestureDetector(
                        onTap: () => Get.to(() => const SignupPage()),
                        child: const Text(
                          ' 지금 가입하세요!',
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
