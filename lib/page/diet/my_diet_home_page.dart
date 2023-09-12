import 'package:fitti_frontend_app/page/diet/diet_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDietHomePage extends StatefulWidget {
  const MyDietHomePage({super.key});

  @override
  State<MyDietHomePage> createState() => _MyDietHomePageState();
}

class _MyDietHomePageState extends State<MyDietHomePage> {
  List<String> dietList = <String>['아침', '점심', '저녁', '간식'];
  String dietTitle = '아침';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My 식단"),
        ),
        body: Center(
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
        ));
  }
}
