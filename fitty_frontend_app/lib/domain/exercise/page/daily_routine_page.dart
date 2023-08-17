import 'package:fitty_frontend_app/domain/exercise/all_exercise_record.dart';
import 'package:fitty_frontend_app/domain/exercise/widget/volume_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'exercise_list_page.dart';

class DailyRoutinePage extends StatelessWidget {
  const DailyRoutinePage(
      {super.key, required this.title, required this.selectedDay});

  final String title;
  final DateTime selectedDay;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Center(child: Consumer<AllExerciseRecord>(
            builder: (context, allExerciseRecord, child) {
              var selectedDayExerciseRecord =
                  allExerciseRecord.getExerciseRecords(selectedDay);
              void deleteExerciseRecord(int index) {
                selectedDayExerciseRecord.volumeRecords.removeAt(index);
                allExerciseRecord.updateExerciseRecords();
              }

              void updateExerciseRecords() {
                allExerciseRecord.updateExerciseRecords();
              }

              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedDayExerciseRecord.volumeRecords.length,
                    itemBuilder: (context, index) {
                      return VolumeRecordWidget(
                        index: index,
                        deleteExerciseRecord: deleteExerciseRecord,
                        updateExerciseRecords: updateExerciseRecords,
                        exerciseRecord:
                            selectedDayExerciseRecord.volumeRecords[index],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () async {
                          String exerciseName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ExerciseListPage()));
                          var exerciseRecord = VolumeRecord();
                          exerciseRecord.exerciseName = exerciseName;
                          selectedDayExerciseRecord.volumeRecords
                              .add(exerciseRecord);
                          allExerciseRecord.updateExerciseRecords();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          foregroundColor: Colors.blue,
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
