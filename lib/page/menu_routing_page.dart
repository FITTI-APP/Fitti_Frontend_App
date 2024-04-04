import 'package:fitti_frontend_app/page/calendar_menu/calendar_page.dart';
import 'package:fitti_frontend_app/page/change_menu/changes_page.dart';
import 'package:fitti_frontend_app/page/home_page/home_page.dart';
import 'package:fitti_frontend_app/page/login_signup/login_page.dart';
import 'package:fitti_frontend_app/widget/appbar/custom_appbar.dart';
import 'package:fitti_frontend_app/widget/appbar/home_page_appbar.dart';
import 'package:fitti_frontend_app/widget/common/menu_routing_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MenuRoutingPage extends StatefulWidget {
  const MenuRoutingPage({
    super.key,
  });

  @override
  State<MenuRoutingPage> createState() => _MenuRoutingPageState();
}

class _MenuRoutingPageState extends State<MenuRoutingPage> {
  int selectedIndex = 0;
  List<List<Widget>> navBarPages = [
    [homePageAppBar(), const HomePage()],
    [
      customAppBar("My Calendar", const [
        Icon(Icons.share),
        Icon(Icons.bar_chart),
        Icon(Icons.more_vert),
      ]),
      const CalendarPage()
    ],
    [customAppBar("title", []), const Text('FITTI')],
    [
      customAppBar("My Change Log", const [
        Icon(Icons.share),
        Icon(Icons.question_mark_rounded),
        Icon(Icons.more_vert),
      ]),
      const ChangesPage()
    ],
    [
      customAppBar("My Page", const [
        Icon(Icons.question_mark_rounded),
        Icon(Icons.settings),
      ]),
      const Text('Menu')
    ],
  ];

  // static const storage = FlutterSecureStorage();

  void onBottomNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBarPages[selectedIndex][0] as PreferredSizeWidget,
      body: navBarPages[selectedIndex][1],
      bottomNavigationBar: MenuRoutingBottomBar(
        currentTab: selectedIndex,
        onBarTap: onBottomNavTap,
      ),
    );
  }
}

enum MenuType {
  logOut,
  setting;

  @override
  String toString() {
    switch (this) {
      case MenuType.logOut:
        return '로그아웃';
      case MenuType.setting:
        return '설정';
      default:
        return '';
    }
  }
}
