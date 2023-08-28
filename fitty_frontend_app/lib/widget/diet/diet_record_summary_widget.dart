import 'package:flutter/material.dart';

class DietRecordSummaryWidget extends StatelessWidget {
  const DietRecordSummaryWidget({
    super.key,
    required this.mealName,
    required this.foodNames,
  });

  final String mealName;
  final List<String> foodNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(8.0),
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
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mealName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foodNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(foodNames[index]),
                  trailing: const Text("100g"),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("수정"),
            )
          ],
        ),
      ),
    );
  }
}
