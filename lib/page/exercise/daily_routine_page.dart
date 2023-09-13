import 'package:fitti_frontend_app/class/provider/my_exercise_record.dart';
import 'package:fitti_frontend_app/class/exercise/one_exercise_record.dart';
import 'package:fitti_frontend_app/page/exercise/exercise_record_list_page.dart';
import 'package:fitti_frontend_app/widget/exercise/one_exercise_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../class/exercise/day_exercise_record.dart';
import 'exercise_list_page.dart';

class DailyRoutinePage extends StatelessWidget {
  const DailyRoutinePage(
      {super.key, required this.title, required this.selectedDay});

  final String title;
  final DateTime selectedDay;

  Color getStateColor(DayExerciseRecordState state) {
    if (state == DayExerciseRecordState.before) {
      return Colors.green;
    } else if (state == DayExerciseRecordState.ongoing) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  String getStateString(DayExerciseRecordState state) {
    if (state == DayExerciseRecordState.before) {
      return '운동시작';
    } else if (state == DayExerciseRecordState.ongoing) {
      return '운동종료';
    } else {
      return '운동완료';
    }
  }

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
                allExerciseRecord.updateExerciseRecordsAndRefreshUi();
              }

              void updateExerciseRecords() {
                allExerciseRecord.updateExerciseRecordsAndRefreshUi();
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
                            allExerciseRecord
                                .updateExerciseRecordsAndRefreshUi();
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
                          allExerciseRecord.updateExerciseRecordsAndRefreshUi();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: const Text(
                          '불러오기',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var state = selectedDayExerciseRecord.state;
                          if (state == DayExerciseRecordState.before) {
                            selectedDayExerciseRecord.state =
                                DayExerciseRecordState.ongoing;
                            selectedDayExerciseRecord.startTime =
                                DateTime.now();
                          } else if (state == DayExerciseRecordState.ongoing) {
                            selectedDayExerciseRecord.state =
                                DayExerciseRecordState.end;
                            selectedDayExerciseRecord.endTime = DateTime.now();
                          } else {
                            return;
                          }
                          allExerciseRecord.updateExerciseRecordsAndRefreshUi();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor:
                                getStateColor(selectedDayExerciseRecord.state)),
                        child: Text(
                          getStateString(selectedDayExerciseRecord.state),
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
