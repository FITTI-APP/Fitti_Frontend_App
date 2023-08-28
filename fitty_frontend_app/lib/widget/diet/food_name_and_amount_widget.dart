import 'package:flutter/material.dart';

import '../../class/food_name_and_amount.dart';

class FoodNameAndAmountWidget extends StatelessWidget {
  FoodNameAndAmountWidget(
      {super.key, required this.foodNameAndAmount, required this.deleteThis});

  final FoodNameAndAmount foodNameAndAmount;
  final Function deleteThis;

  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    foodNameController.text = foodNameAndAmount.name;
    foodAmountController.text = foodNameAndAmount.amount.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 100,
          height: 30,
          child: TextField(
            onTap: () => foodNameController.selection = TextSelection(
                baseOffset: 0, extentOffset: foodNameController.text.length),
            controller: foodNameController,
            textAlign: TextAlign.center,
            onChanged: (value) => {
              foodNameAndAmount.name = value,
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: '음식',
              counterText: '',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 80,
              height: 30,
              child: TextField(
                onTap: () => foodAmountController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: foodAmountController.text.length),
                controller: foodAmountController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onChanged: (value) => {
                  foodNameAndAmount.amount = int.parse(value),
                },
                decoration: const InputDecoration(
                  hintText: 'g',
                  contentPadding: EdgeInsets.all(0),
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 14),
            const Text('g'),
          ],
        ),
      ],
    );
  }
}
