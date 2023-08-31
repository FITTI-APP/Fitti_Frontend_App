import 'package:flutter/material.dart';

class FoodSearchPage extends StatefulWidget {
  const FoodSearchPage({super.key});

  @override
  State<FoodSearchPage> createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  var foodNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('음식 검색'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            TextField(
              controller: foodNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '음식 이름',
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('검색')),
            Expanded(
              child: ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Text('음식 이름'),
                        subtitle: Text('음식 칼로리'),
                      ),
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}
