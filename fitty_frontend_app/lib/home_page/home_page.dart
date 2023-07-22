import 'package:flutter/material.dart';
import 'tab_page/my_exercise.dart';
import 'tab_page/my_diet.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Handle the notification button tap here.
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle the settings button tap here.
            },
          ),
        ],
        title: const Center(child: Text('FITTY')),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Container(
                height: 60,
                child: Tab(
                  text: "My 운동",
                ),
              ),
              Container(
                height: 60,
                child: Tab(
                  text: "My 식단",
                ),
              ),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                MyExercise(),
                MyDiet(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.area_chart_outlined),
            label: 'Changes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'MY',
          ),
        ],
      ),
    );
  }
}
