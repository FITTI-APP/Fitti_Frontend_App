import 'package:fitty_frontend_app/widget/exercise/exercise_widget.dart';
import 'package:flutter/material.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  List<String> _exercises = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 목록'),
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
