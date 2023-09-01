import 'dart:convert';

import 'package:fitti_frontend_app/class/food_name_and_amount.dart';
import 'package:fitti_frontend_app/page/diet/food_amount_input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodSearchPage extends StatefulWidget {
  const FoodSearchPage({super.key});

  @override
  State<FoodSearchPage> createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  var foodApiKey = dotenv.env['FOOD_API_KEY']!;
  var foodNameController = TextEditingController();
  late String url;
  int page = 0;
  final int limit = 50;
  bool hasNextPage = true;
  bool isLoadRunning = false;
  List<String> foodNameList = [];
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    url = "https://openapi.foodsafetykorea.go.kr/api/$foodApiKey/I2790/json/";
    scrollController = ScrollController()..addListener(_nextLoad);
  }

  void _initLoad() async {
    page = 0;
    setState(() {
      foodNameList = [];
      isLoadRunning = true;
    });
    try {
      final res = await http
          .get(Uri.parse("${url}1/$limit/DESC_KOR=${foodNameController.text}"));

      setState(() {
        var temp = json
            .decode(res.body)['I2790']['row']
            .map((e) => e['DESC_KOR'])
            .toList();
        foodNameList = temp.cast<String>();
        if (foodNameList.length < limit) hasNextPage = false;
      });
    } catch (e) {}
    setState(() {
      isLoadRunning = false;
    });
  }

  void _nextLoad() async {
    if (foodNameController.text.isEmpty) return;
    if (!hasNextPage || isLoadRunning) return;
    if (scrollController.position.extentAfter > 200) return;
    setState(() {
      isLoadRunning = true;
    });
    page++;
    try {
      final res = await http.get(Uri.parse(
          "$url${page * limit + 1}/${(page + 1) * limit}/DESC_KOR=${foodNameController.text}"));
      var nextFoodNameList = json
          .decode(res.body)['I2790']['row']
          .map((e) => e['DESC_KOR'])
          .toList();
      setState(() {
        foodNameList.addAll(nextFoodNameList.cast<String>());
        if (nextFoodNameList.length < limit) hasNextPage = false;
      });
    } catch (e) {}
    setState(() {
      isLoadRunning = false;
    });
  }

  @override
  void dispose() {
    foodNameController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('음식 검색'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            children: <Widget>[
              TextField(
                controller: foodNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '음식 이름',
                ),
              ),
              ElevatedButton(onPressed: _initLoad, child: const Text('검색')),
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: foodNameList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == foodNameList.length) {
                        return const SizedBox(
                          height: 20,
                        );
                      }
                      return SizedBox(
                        height: 50,
                        child: ListTile(
                          onTap: () async {
                            int foodAmount = await Get.to(() =>
                                FoodAmountInputPage(
                                    foodName: foodNameList[index]));
                            Get.back(
                                result: FoodNameAndAmount(
                                    foodNameList[index], foodAmount));
                          },
                          title: Text(foodNameList[index]),
                          subtitle: const Text('열량 : {}kcal'),
                        ),
                      );
                    }),
              ),
              if (isLoadRunning)
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Center(child: CircularProgressIndicator()),
                )
            ],
          )),
        ),
      ),
    );
  }
}
