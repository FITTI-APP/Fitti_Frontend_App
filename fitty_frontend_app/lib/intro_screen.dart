import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 63, 187, 250),
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
                SizedBox(
                  height: 50,
                ),
                Image(
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                    image: AssetImage('asset/giphy.gif')),
                Text(
                  "Now Loading...",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
