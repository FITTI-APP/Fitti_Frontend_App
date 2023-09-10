import 'package:fitti_frontend_app/data/my_exercise_record.dart';
import 'package:fitti_frontend_app/data/class/one_exercise_record.dart';
import 'package:fitti_frontend_app/page/exercise/exercise_record_list_page.dart';
import 'package:fitti_frontend_app/widget/exercise/one_exercise_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../data/class/day_exercise_record.dart';
import 'exercise_list_page.dart';

class DailyRoutinePageOther extends StatelessWidget {
  const DailyRoutinePageOther(
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
          child: Center(child: Consumer<MyExerciseRecord>(
            builder: (context, allExerciseRecord, child) {
              var selectedDayExerciseRecord =
                  allExerciseRecord.getDayExerciseRecord(selectedDay);
              void deleteExerciseRecord(int index) {
                selectedDayExerciseRecord.oneExerciseRecords.removeAt(index);
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
                    itemCount:
                        selectedDayExerciseRecord.oneExerciseRecords.length,
                    itemBuilder: (context, index) {
                      return OneExerciseRecordWidget(
                        index: index,
                        deleteExerciseRecord: deleteExerciseRecord,
                        updateExerciseRecords: updateExerciseRecords,
                        oneExerciseRecord:
                            selectedDayExerciseRecord.oneExerciseRecords[index],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          String? exerciseName =
                              await Get.to(() => const ExerciseListPage());
                          if (exerciseName != null) {
                            var oneExerciseRecord = OneExerciseRecord();
                            oneExerciseRecord.exerciseName = exerciseName;
                            selectedDayExerciseRecord.oneExerciseRecords
                                .add(oneExerciseRecord);
                            allExerciseRecord.updateExerciseRecords();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: const Text(
                          '운동 추가하기',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var recordExistingEntries =
                              allExerciseRecord.recordExistingEntries;
                          recordExistingEntries
                              .sort((a, b) => b.key.compareTo(a.key));
                          var selectedExerciseRecords =
                              await Get.to(() => ExerciseRecordListPage(
                                    recordExistingEntries:
                                        recordExistingEntries,
                                  ));
                          for (var selectedExerciseRecord
                              in selectedExerciseRecords) {
                            selectedDayExerciseRecord.oneExerciseRecords
                                .add(selectedExerciseRecord);
                          }
                          allExerciseRecord.updateExerciseRecords();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: const Text(
                          '불러오기',
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
