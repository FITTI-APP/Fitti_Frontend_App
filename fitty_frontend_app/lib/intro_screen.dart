import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 00, 173, 199),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "F I T T I",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Text(
                  "당신의 피트니스 친구",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Image(image: AssetImage('asset/flankggg.gif')),
              ],
            ),
          ),
        ));
  }
}
