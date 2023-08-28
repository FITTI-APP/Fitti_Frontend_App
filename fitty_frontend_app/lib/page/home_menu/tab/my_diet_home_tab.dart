import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../diet/diet_editting_page.dart';

class MyDietHomeTab extends StatefulWidget {
  const MyDietHomeTab({
    super.key,
  });

  @override
  State<MyDietHomeTab> createState() => _MyDietHomeTabState();
}

class _MyDietHomeTabState extends State<MyDietHomeTab> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['아침', '점심', '저녁', '간식'];
    String dropdownValue = list.first;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                () => DietEdittingPage(),
                arguments: dropdownValue,
              );
            },
            child: const Text('식단 추가'),
          )
        ],
      ),
    );
  }
}
