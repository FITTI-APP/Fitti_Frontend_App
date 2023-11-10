import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/diet/diet_circle_graph_widget.dart';

final List<Meal> _mealList = [
  Meal(name: "식사1", calorie: 100, carbohydrate: 100, protein: 100, fat: 100),
  Meal(name: "식사2", calorie: 100, carbohydrate: 100, protein: 100, fat: 100),
  Meal(name: "식사3", calorie: 100, carbohydrate: 100, protein: 100, fat: 100),
];

class Meal {
  // todo 임시로 만든거임. 나중에 식단 데이터 받아오기.
  final String name;
  final int calorie;
  final int carbohydrate;
  final int protein;
  final int fat;

  Meal(
      {required this.name,
      required this.calorie,
      required this.carbohydrate,
      required this.protein,
      required this.fat});
}

class MyDietTodayDietInput extends StatefulWidget {
  const MyDietTodayDietInput({
    super.key,
    required this.datetime,
  });

  final DateTime datetime;

  @override
  _MyDietTodayDietInputState createState() => _MyDietTodayDietInputState();
}

class _MyDietTodayDietInputState extends State<MyDietTodayDietInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 186, 167, 167),
        elevation: 1,
        title: const Text("My 식단"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "asset/icon/bar_graph.png",
              width: 25,
              height: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 186, 167, 167),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  DietCircleGraphWidget(
                    datetime: DateTime.now(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var meal in _mealList) //todo 나중에 식단 데이터 받아오기.
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(meal.name),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("--${meal.calorie}kcal"),
                            const Expanded(
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 0,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(
                                  flex: 3,
                                ),
                                Text("탄수화물 --${meal.carbohydrate}g"),
                                const Spacer(),
                                Text("단백질 --${meal.protein}g"),
                                const Spacer(),
                                Text("지방 --${meal.fat}g"),
                                const Spacer(
                                  flex: 3,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 186, 167, 167),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
