import 'package:fitty_frontend_app/data/my_exercise_record.dart';
import 'package:fitty_frontend_app/data/class/one_exercise_record.dart';
import 'package:fitty_frontend_app/data/class/one_set_record.dart';
import 'package:fitty_frontend_app/widget/exercise/one_exercise_records_of_all_date_widget.dart';
import 'package:flutter/material.dart';
import 'one_set_record_widget.dart';

class OneExerciseRecordWidget extends StatelessWidget {
  const OneExerciseRecordWidget({
    super.key,
    required this.index,
    required this.oneExerciseRecord,
    required this.deleteExerciseRecord,
    required this.updateExerciseRecords,
  });

  final int index;
  final OneExerciseRecord oneExerciseRecord;
  final Function deleteExerciseRecord;
  final Function updateExerciseRecords;

  @override
  Widget build(BuildContext context) {
    void deleteSet(int index) {
      oneExerciseRecord.oneSetRecords.removeAt(index);
      updateExerciseRecords();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Container(
              width: 400,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 550,
                                      child: OneExerciseRecordsOfAllDateWidget(
                                        exersiseName:
                                            oneExerciseRecord.exerciseName,
                                      ),
                                    ),
                                  ));
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                      Text(
                        oneExerciseRecord.exerciseName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteExerciseRecord(index);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: oneExerciseRecord.oneSetRecords.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OneSetRecordWidget(
                        index: index,
                        deleteThis: deleteSet,
                        updateExerciseRecords: updateExerciseRecords,
                        oneSetInfo: oneExerciseRecord.oneSetRecords[index],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int kg = oneExerciseRecord.oneSetRecords.isEmpty
                          ? 0
                          : oneExerciseRecord.oneSetRecords.last.weight;
                      int reps = oneExerciseRecord.oneSetRecords.isEmpty
                          ? 0
                          : oneExerciseRecord.oneSetRecords.last.reps;
                      var setRecord = OneSetRecord();
                      setRecord.weight = kg;
                      setRecord.reps = reps;
                      oneExerciseRecord.oneSetRecords.add(setRecord);
                      updateExerciseRecords();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      foregroundColor:
                          Colors.blue, // Set button background color
                    ),
                    child: const Text(
                      '추가',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
