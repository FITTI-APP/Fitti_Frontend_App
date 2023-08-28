import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../diet/diet_edit_page.dart';

class MyDietHomeTab extends StatefulWidget {
  const MyDietHomeTab({
    super.key,
  });

  @override
  State<MyDietHomeTab> createState() => _MyDietHomeTabState();
}

class _MyDietHomeTabState extends State<MyDietHomeTab> {
  List<String> dietList = <String>['아침', '점심', '저녁', '간식'];
  String dietTitle = '아침';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<String>(
            value: dietTitle,
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String? value) {
              setState(() {
                dietTitle = value!;
              });
            },
            items: dietList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                () => DietEditPage(title: dietTitle),
              );
            },
            child: const Text('식단 추가'),
          )
        ],
      ),
    );
  }
}
