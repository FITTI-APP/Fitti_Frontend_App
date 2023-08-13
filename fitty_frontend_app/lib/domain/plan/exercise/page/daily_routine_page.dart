import 'package:fitty_frontend_app/domain/plan/exercise/all_exercise_record.dart';
import 'package:fitty_frontend_app/domain/plan/exercise/widget/exercise_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'exercise_list_page.dart';

class DailyRoutinePage extends StatelessWidget {
  const DailyRoutinePage({super.key});

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
          child: Center(child: Consumer<AllExerciseRecord>(
            builder: (context, exerciseRecordsOfDays, child) {
              var exerciseRecordsOfTheDay =
                  exerciseRecordsOfDays.getExerciseRecords(DateTime.now());
              void deleteExerciseRecord(int index) {
                exerciseRecordsOfTheDay.exerciseRecords.removeAt(index);
                exerciseRecordsOfDays.updateExerciseRecords();
              }

              void updateExerciseRecords() {
                exerciseRecordsOfDays.updateExerciseRecords();
              }

              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exerciseRecordsOfTheDay.exerciseRecords.length,
                    itemBuilder: (context, index) {
                      return ExerciseRecordWidget(
                        index: index,
                        deleteExerciseRecord: deleteExerciseRecord,
                        updateExerciseRecords: updateExerciseRecords,
                        exerciseRecord:
                            exerciseRecordsOfTheDay.exerciseRecords[index],
                      );
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
                                  builder: (context) =>
                                      const ExerciseListPage()));
                          var exerciseRecord = ExerciseRecord(
                            exerciseName: exerciseName,
                          );
                          exerciseRecordsOfTheDay.exerciseRecords
                              .add(exerciseRecord);
                          exerciseRecordsOfDays.updateExerciseRecords();
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
                          // Handle 'Load' button press
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
                    ],
                  )
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
