import 'package:fitti_frontend_app/page/diet/my_diet_home_page.dart';
import 'package:fitti_frontend_app/page/exercise/my_exercise_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("OOO님 안녕하세요!"),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("여러분의 건강도우미 FITTI입니다."),
        ),
        const Card(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("금주의 3대 1위는?"),
                Text("정재현님"),
              ],
            ),
          ),
        ),
        Row(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("지난 1주일 동안 정재현님의 기록입니다."),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 20),
                    padding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "이번 달 조회하기",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
        MyHomeWidget(
          title: "My 운동",
          nextPage: MyExerciseHomePage(),
          body: const Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("차트"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("총 볼륨 : 19045 kg"),
                  Text("총 세트 : 2974 세트"),
                ],
              ),
            ],
          )),
        ),
        const SizedBox(height: 10),
        MyHomeWidget(
            title: "My 식단",
            nextPage: const MyDietHomePage(),
            body: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text("2350\nKcal"),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text("차트"),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({
    super.key,
    required this.title,
    required this.nextPage,
    required this.body,
  });

  final String title;
  final Widget nextPage;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                Text(title),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(nextPage);
                          },
                          child: const Text(
                            "자세히 보기",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 5,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body,
          ],
        )),
      ),
    );
  }
}
