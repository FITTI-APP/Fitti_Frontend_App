import 'package:fitty_frontend_app/data/all_exercise_record.dart';
import 'package:fitty_frontend_app/page/exercise/exercise_record_list_page.dart';
import 'package:fitty_frontend_app/widget/exercise/one_exercise_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'exercise_list_page.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage(
      {super.key, required this.title, required this.selectedDay});

  final String title;
  final DateTime selectedDay;

  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage> {
  int istimeGo = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(child: Consumer<AllExerciseRecord>(
            builder: (context, allExerciseRecord, child) {
              var selectedDayExerciseRecord =
                  allExerciseRecord.getDayExerciseRecord(widget.selectedDay);
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
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            String? exerciseName =
                                await Get.to(() => const ExerciseListPage(
                                      content: '',
                                    ));
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
                            foregroundColor: Colors.blue,
                          ),
                          child: const Text(
                            '운동 추가하기',
                            style: TextStyle(color: Colors.white),
                          ),
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
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text(
                          '불러오기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          istimeGo++;
                          setState(() {});
                          if (istimeGo % 2 == 1) {
                            selectedDayExerciseRecord.startTime =
                                DateTime.now();
                          } else {
                            selectedDayExerciseRecord.endTime = DateTime.now();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor:
                              istimeGo == 0 ? Colors.green : Colors.red,
                        ),
                        child: Text(
                          istimeGo == 0 ? '운동시작' : '운동종료',
                          style: const TextStyle(color: Colors.white),
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
