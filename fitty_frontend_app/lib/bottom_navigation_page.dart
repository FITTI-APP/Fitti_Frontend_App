import 'package:flutter/material.dart';
import 'bottom_menu/calendar_page/calendar_page.dart';
import 'bottom_menu/home_page/home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
  });

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  List<Widget> navBarPages = [
    HomePage(),
    CalendarPage(),
    const Text('Changes'),
    const Text('MY'),
  ];
  void onBottomNavTap(int _index) {
    setState(() {
      _selectedIndex = _index;
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
      body: navBarPages[_selectedIndex],
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
        currentIndex: _selectedIndex,
        onTap: onBottomNavTap,
      ),
    );
  }
}
