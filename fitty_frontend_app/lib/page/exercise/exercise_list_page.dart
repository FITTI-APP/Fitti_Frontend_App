import 'package:fitty_frontend_app/widget/exercise/exercise_widget.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(selectedResult),
    );
  }

  final List<String> listExample;

  Search(this.listExample);

  List<String> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];

    query.isEmpty
        ? suggestionList = recentList //In the true case

        : suggestionList.addAll(listExample.where(
            // In the false case

            (element) => element.contains(query),
          ));
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? const Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
          },
        );
      },
    );
  }
}

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  final List<String> _exercises = [
    "벤치프레스",
    "스쿼트",
    "데드리프트",
    "오버헤드 프레스",
    "바벨 로우",
    "풀업",
    "펜들레이 로우",
    "라잉 트라이셉스 익스텐션",
    "바벨 컬",
    "인클라인 덤벨 벤치프레스",
    "인클라인 벤치프레스",
    "덤벨 벤치프레스",
    "덤벨 플라이",
    "덤벨 숄더 프레스",
    "시티드 케이블 로우",
    "해머 컬",
    "프론트 레이즈",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: Search(_exercises));
          },
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _exercises.length,
          itemBuilder: (context, index) {
            return ExerciseWidget(
              exerciseName: _exercises[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}
