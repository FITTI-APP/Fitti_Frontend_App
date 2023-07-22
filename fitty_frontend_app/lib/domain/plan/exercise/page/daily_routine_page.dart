import 'package:fitty_frontend_app/domain/plan/exercise/widget/exercise_volume_widget.dart';
import 'package:flutter/material.dart';

import 'exercise_list_page.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({super.key});

  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage> {
  List<ExerciseVolumeWidget> exerciseVolumeWidgets = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('오늘의 운동'),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: exerciseVolumeWidgets.length,
                itemBuilder: (context, index) {
                  return exerciseVolumeWidgets[index];
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      String exerciseName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExerciseListPage()));
                      setState(() {
                        var exerciseVolumeWidget =
                            ExerciseVolumeWidget(exerciseName: exerciseName);
                        exerciseVolumeWidgets.add(exerciseVolumeWidget);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // minimumSize: Size.fromWidth(10000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      foregroundColor:
                          Colors.blue, // Set button background color
                    ),
                    child: const Text(
                      '운동 추가하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle 'Save' button press
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      foregroundColor:
                          Colors.blue, // Set button background color
                    ),
                    child: const Text(
                      '불러오기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle 'Save' button press
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      foregroundColor:
                          Colors.blue, // Set button background color
                    ),
                    child: const Text(
                      '저장하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
