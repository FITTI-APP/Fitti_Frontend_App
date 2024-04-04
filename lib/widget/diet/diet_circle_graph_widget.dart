import 'package:flutter/material.dart';

class DietCircleGraphWidget extends StatelessWidget {
  const DietCircleGraphWidget({
    super.key,
    required this.datetime,
  });

  final DateTime datetime; // 이걸로 식단 조회 쿼리를 날린다.

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Center(
            child: Text("목표: 2400Kcal"),
          ),
        ),
        const Spacer(),
        const Column(
          children: [
            Text("오늘 섭취량"),
            Text("2350Kcal"),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
