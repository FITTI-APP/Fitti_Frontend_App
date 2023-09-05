import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:fitti_frontend_app/api/api.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class AuthService extends ChangeNotifier {
  User? currentUser;

  void setUser(User? user) {
    currentUser = user;
    notifyListeners();
  }

  void removeUser() {
    currentUser = null;
    notifyListeners();
  }

  bool get isLogin => currentUser != null;

  String? get uid => currentUser?.uid;

  void signUp(
      {required String email,
      required String password,
      required String name,
      required Function onFail,
      required Function onSuccess}) async {
    if (email.isEmpty) {
      onFail("이메일을 입력해주세요.");
      return;
    }
    if (password.isEmpty) {
      onFail("비밀번호를 입력해주세요.");
      return;
    }
    if (name.isEmpty) {
      onFail("이름을 입력해주세요.");
      return;
    }
    try {
      http.Response response = await http.post(Uri.parse(API.register), body: {
        "email": email,
        "password": password,
        "name": name,
      });
      if (response.statusCode == 200) {
        onSuccess();
        notifyListeners();
      } else {
        onFail("회원가입에 실패했습니다.");
      }
    } catch (e) {
      onFail("회원가입에 실패했습니다.");
    }
  }

  void signIn(
      {required String email,
      required String password,
      required Function(String err) onFail,
      required Function(String) onSuccess}) async {
    if (email.isEmpty) {
      onFail("이메일을 입력해주세요.");
      return;
    }
    if (password.isEmpty) {
      onFail("비밀번호를 입력해주세요.");
      return;
    }

    try {
      var dio = Dio();
      Response response = await dio.post(API.login, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        String token = response.data["token"];
        final jwt = JWT.decode(token);
        Map<String, dynamic> payload = jwt.payload;
        String email = payload["email"];
        var val = jsonEncode({"email": email, "token": token});
        onSuccess(val);
        notifyListeners();
      } else {
        onFail("로그인에 실패했습니다.");
      }
    } on JWTExpiredException {
      onFail("로그인에 실패했습니다.");
    } on JWTException {
      onFail("로그인에 실패했습니다.");
    } catch (e) {
      onFail("로그인에 실패했습니다.");
    }
  }
}

class User {
  final String uid;
  User({required this.uid});
}
