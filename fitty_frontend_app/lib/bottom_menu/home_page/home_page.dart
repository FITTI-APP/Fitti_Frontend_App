import 'package:flutter/material.dart';

import 'tab/my_diet_home.dart';
import 'tab/my_exercise_home.dart';

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
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: [
            Container(
              height: 60,
              child: Tab(
                text: "My 운동",
              ),
            ),
            Container(
              height: 60,
              child: Tab(
                text: "My 식단",
              ),
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              MyExerciseHome(),
              MyDietHome(),
            ],
          ),
        ),
      ],
    );
  }
}
