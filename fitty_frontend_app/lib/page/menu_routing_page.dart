import 'package:fitty_frontend_app/page/calendar_menu/calendar_page.dart';
import 'package:fitty_frontend_app/page/home_menu/home_page.dart';
import 'package:flutter/material.dart';

class MenuRoutingPage extends StatefulWidget {
  const MenuRoutingPage({
    super.key,
  });

  @override
  State<MenuRoutingPage> createState() => _MenuRoutingPageState();
}

class _MenuRoutingPageState extends State<MenuRoutingPage> {
  int selectedIndex = 0;
  List<Widget> navBarPages = [
    const HomePage(),
    const CalendarPage(),
    const Text('Changes'),
    const Text('MY'),
  ];
  void onBottomNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
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
      body: navBarPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
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
        currentIndex: selectedIndex,
        onTap: onBottomNavTap,
      ),
    );
  }
}
