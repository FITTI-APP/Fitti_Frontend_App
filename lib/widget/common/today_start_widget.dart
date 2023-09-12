import 'package:fitti_frontend_app/page/exercise/daily_routine_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodayStartWidget extends StatelessWidget {
  const TodayStartWidget({
    super.key,
    required this.now,
    required this.buttonText,
  });

  final DateTime now;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Text(
              DateFormat('MM/dd\nEEEE', 'ko').format(now),
              textAlign: TextAlign.center,
            ),
            const VerticalDivider(),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(DailyRoutinePage(
                        title: "My Exercise", selectedDay: now));
                  },
                  child: Text(buttonText),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
