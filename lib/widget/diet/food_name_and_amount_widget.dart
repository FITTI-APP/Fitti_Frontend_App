import 'package:flutter/material.dart';

import '../../class/food_name_and_amount.dart';

class FoodNameAndAmountWidget extends StatelessWidget {
  const FoodNameAndAmountWidget(
      {super.key, required this.foodNameAndAmount, required this.deleteThis});

  final FoodNameAndAmount foodNameAndAmount;
  final Function deleteThis;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(foodNameAndAmount.name),
      subtitle: Text(foodNameAndAmount.amount.toString()),
    );
  }
}
