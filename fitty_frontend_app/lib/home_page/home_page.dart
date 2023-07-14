import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab_page/my_exercise.dart';
import 'tab_page/my_fitty.dart';
import 'tab_page/my_management.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        bottom: const TabBar(
          tabs: [
            Tab(
              text: "My 운동",
            ),
            Tab(text: "My 관리"),
            Tab(text: "Fitty"),
          ],
        ),
        title: Center(child: Text('FITTY')),
      ),
      body: const TabBarView(
        children: [
          MyExercise(),
          MyManagement(),
          MyFitty(),
        ],
      ),

      // body: ListView(
      //   children: const <Widget>[
      //     Card(child: ListTile(title: Text('One-line ListTile'))),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(),
      //         title: Text('Title 왼쪽에 아이콘 표시'),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('Title 오른쪽에 아이콘 표시'),
      //         trailing: Icon(Icons.more_vert),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(),
      //         title: Text('leading, trailing 속성을 모두 지정'),
      //         trailing: Icon(Icons.more_vert),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text('dense : true 로 지정'),
      //         dense: true,
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(size: 56.0),
      //         title: Text('Title-Text'),
      //         subtitle: Text('Subtitle-Text'),
      //         trailing: Icon(Icons.more_vert),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(size: 72.0),
      //         title: Text('Three-line ListTile'),
      //         subtitle: Text('isThreeLine : true 로 주면 subtitle 이 어떻게 변할까'),
      //         trailing: Icon(Icons.more_vert),
      //         isThreeLine: true,
      //         //dense: true,
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(size: 72.0),
      //         title: Text('Three-line ListTile'),
      //         subtitle: Text('isThreeLine : true 로 주면 subtitle 이 어떻게 변할까'),
      //         trailing: Icon(Icons.more_vert),
      //         isThreeLine: true,
      //         //dense: true,
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(size: 72.0),
      //         title: Text('Three-line ListTile'),
      //         subtitle: Text('isThreeLine : true 로 주면 subtitle 이 어떻게 변할까'),
      //         trailing: Icon(Icons.more_vert),
      //         isThreeLine: true,
      //         //dense: true,
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(size: 72.0),
      //         title: Text('Three-line ListTile'),
      //         subtitle: Text('isThreeLine : true 로 주면 subtitle 이 어떻게 변할까'),
      //         trailing: Icon(Icons.more_vert),
      //         isThreeLine: true,
      //         //dense: true,
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         leading: FlutterLogo(size: 72.0),
      //         title: Text('Three-line ListTile'),
      //         subtitle: Text('isThreeLine : true 로 주면 subtitle 이 어떻게 변할까'),
      //         trailing: Icon(Icons.more_vert),
      //         isThreeLine: true,
      //         //dense: true,
      //       ),
      //     ),
      //   ],
      // ),
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
