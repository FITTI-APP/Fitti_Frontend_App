import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "F I T T Y",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  "당신의 피트니스 친구",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
