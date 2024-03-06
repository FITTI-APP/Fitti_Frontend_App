import 'package:fitti_frontend_app/page/calendar_menu/calendar_page.dart';
import 'package:fitti_frontend_app/page/change_menu/changes_page.dart';
import 'package:fitti_frontend_app/page/home_page/home_page.dart';
import 'package:fitti_frontend_app/page/login_signup/login_page.dart';
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
  List<Widget> navBarPages = [
    const HomePage(),
    const CalendarPage(),
    const Text('FITTI'),
    const ChangesPage(),
    const Text('Menu'),
  ];

  static const storage = FlutterSecureStorage();

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
          PopupMenuButton(
            itemBuilder: ((context) => [
                  for (final value in MenuType.values)
                    PopupMenuItem(
                      value: value,
                      child: Text(value.toString()),
                      onTap: () {
                        switch (value) {
                          case MenuType.logOut:
                            storage.delete(key: "userInfo");
                            Get.off(() => const LoginPage());
                            break;
                          case MenuType.setting:
                            break;
                        }
                      },
                    )
                ]),
          )
        ],
        title: const Center(child: Text('FITTI')),
      ),
      body: navBarPages[selectedIndex],
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
