import 'package:flutter/material.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise List'),
      ),
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('벤치프레스'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('스쿼트'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('데드리프트'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('오버헤드 프레스'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('사이드 레터럴 레이즈'),
            ),
          ],
        ),
      ),
    );
  }
}
