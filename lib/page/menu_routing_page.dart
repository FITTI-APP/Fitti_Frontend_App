import 'package:fitti_frontend_app/api/api.dart';
import 'package:fitti_frontend_app/page/calendar_menu/calendar_page.dart';
import 'package:fitti_frontend_app/page/change_menu/changes_page.dart';
import 'package:fitti_frontend_app/page/fitti_menu/test_page.dart';
import 'package:fitti_frontend_app/page/home/home_page.dart';
import 'package:fitti_frontend_app/widget/appbar/custom_appbar.dart';
import 'package:fitti_frontend_app/widget/appbar/home_page_appbar.dart';
import 'package:fitti_frontend_app/widget/common/menu_routing_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MenuRoutingPage extends StatefulWidget {
  const MenuRoutingPage({
    super.key,
    required this.token,
  });

  final String token;

  @override
  State<MenuRoutingPage> createState() => _MenuRoutingPageState();
}

class _MenuRoutingPageState extends State<MenuRoutingPage> {
  int selectedIndex = 0;
  late ValueNotifier<GraphQLClient> client;
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
    [customAppBar("title", []), const TestPage()],
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
  void initState() {
    super.initState();
    final HttpLink httpLink = HttpLink(API.graphql);
    var authLink = AuthLink(
      getToken: () async => 'Bearer ${widget.token}',
    );
    final Link link = authLink.concat(httpLink);
    var graphQLClient = GraphQLClient(
      cache: GraphQLCache(
          store: InMemoryStore(),
          partialDataPolicy: PartialDataCachePolicy.accept),
      link: link,
    );
    client = ValueNotifier(graphQLClient);
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: Scaffold(
        appBar: navBarPages[selectedIndex][0] as PreferredSizeWidget,
        body: navBarPages[selectedIndex][1],
        bottomNavigationBar: MenuRoutingBottomBar(
          currentTab: selectedIndex,
          onBarTap: onBottomNavTap,
        ),
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
