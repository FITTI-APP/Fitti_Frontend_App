import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';
import '../../model/user.dart';

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

  checkUserEmail() async {
    try {
      var response = await http.post(Uri.parse(API.validateEmail), body: {
        'user_email': _emailController.text.trim(),
      });

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['existEmail'] == true) {
          Fluttertoast.showToast(
              msg: "Email already exist",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        saveInfo();
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveInfo() async {
    User userModel = User(
      1,
      _userNameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: 'Signup successfully');
        } else {
          Fluttertoast.showToast(msg: 'Error occuredplease try again');
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  border: InputBorder.none, hintText: 'Email'),
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
                    if (_formKey.currentState!.validate()) {
                      checkUserEmail();
                    }
                  },
                  child: Container(
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
    );
  }
}
