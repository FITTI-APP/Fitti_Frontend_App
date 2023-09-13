import 'package:fitti_frontend_app/class/exercise/exercise.dart';
import 'package:fitti_frontend_app/class/service/exercise_list_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ExerciseAddPage extends StatelessWidget {
  ExerciseAddPage({super.key});
  final TextEditingController exerciseNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 추가'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: exerciseNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '운동 이름',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  var exerciseListProvider =
                      context.read<ExerciseListProvider>();
                  var exerciseName = exerciseNameController.text;
                  bool isSuccess = await exerciseListProvider
                      .addExercise(Exercise(exerciseName, true));
                  if (!isSuccess) {
                    Get.snackbar('운동 추가 실패', '이미 존재하는 운동입니다.',
                        duration: const Duration(seconds: 2));
                    return;
                  }
                  Get.back();
                },
                child: const Text('추가')),
          ],
        ),
      ),
    );
  }
}
