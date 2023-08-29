import 'package:fitti_frontend_app/class/food_name_and_amount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/diet/food_name_and_amount_widget.dart';

class DietEditPage extends StatefulWidget {
  const DietEditPage({super.key, required this.title});

  final String title;

  @override
  State<DietEditPage> createState() => _DietEditPageState();
}

class _DietEditPageState extends State<DietEditPage> {
  void deleteWidget(int index) {
    setState(() {
      foodNameAndAmountList.removeAt(index);
    });
  }

  List<FoodNameAndAmount> foodNameAndAmountList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: foodNameAndAmountList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              foodNameAndAmountList.removeAt(index);
                            });
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FoodNameAndAmountWidget(
                                foodNameAndAmount: foodNameAndAmountList[index],
                                deleteThis: deleteWidget,
                              )),
                        );
                      }),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        foodNameAndAmountList.add(FoodNameAndAmount('음식', 0));
                      });
                    },
                    child: const Text('음식 추가'),
                  )
                ],
              ),
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
