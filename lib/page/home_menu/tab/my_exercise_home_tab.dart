import 'package:fitti_frontend_app/page/exercise/daily_routine_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyExerciseHomeTab extends StatelessWidget {
  const MyExerciseHomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _pageOfTop(),
      _pageOfBottom(),
    ]);
  }
}

final pictureLists = [
  'asset/workout1.jpg',
  'asset/workout2.jpg',
  'asset/workout3.jpg',
  'asset/workout4.jpg',
  'asset/workout5.jpg',
];
Widget _pageOfTop() {
  return CarouselSlider(
    options: CarouselOptions(height: 175, autoPlay: true),
    items: pictureLists.map((url) {
      return Builder(builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              url,
              fit: BoxFit.cover,
            ),
          ),
        );
      });
    }).toList(),
  );
}

Widget _pageOfBottom() {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        Get.to(() => DailyRoutinePage(
              title: "오늘의 운동",
              selectedDay: DateTime.now(),
            ));
      },
      child: const Text('오늘의 운동 시작하기'),
    ),
  );
}
