import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietEdittingPage extends StatefulWidget {
  const DietEdittingPage({super.key});

  @override
  State<DietEdittingPage> createState() => _DietEdittingPageState();
}

class _DietEdittingPageState extends State<DietEdittingPage> {
  List<FoodAndAmount> foodAndAmountList = [];
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('식단 추가'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: foodAndAmountList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            foodAndAmountList.removeAt(index);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 400,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 1),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '음식 이름',
                                      ),
                                      onChanged: (text) {
                                        foodAndAmountList[index].foodName =
                                            text;
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '음식 양',
                                      ),
                                      onChanged: (text) {
                                        foodAndAmountList[index].amount =
                                            int.parse(text);
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    }),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      foodAndAmountList.add(FoodAndAmount('음식', 0));
                    });
                  },
                  child: const Text('음식 추가'),
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('저장'),
              ),
            ],
          ),
        ));
  }
}

class FoodAndAmount {
  String foodName;
  int amount;
  FoodAndAmount(this.foodName, this.amount);
}
