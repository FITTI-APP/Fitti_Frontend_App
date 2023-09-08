import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FoodAmountInputPage extends StatelessWidget {
  FoodAmountInputPage({super.key, required this.foodName});

  final String foodName;
  final TextEditingController foodAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: foodAmountController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$'))
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '음식의 양을 입력해주세요',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back(result: int.parse(foodAmountController.text));
              },
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
