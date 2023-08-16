import 'package:fitty_frontend_app/domain/exercise/all_exercise_record.dart';
import 'package:flutter/material.dart';
import 'set_record_widget.dart';

class VolumeRecordWidget extends StatelessWidget {
  const VolumeRecordWidget({
    super.key,
    required this.index,
    required this.exerciseRecord,
    required this.deleteExerciseRecord,
    required this.updateExerciseRecords,
  });

  final int index;
  final VolumeRecord exerciseRecord;
  final Function deleteExerciseRecord;
  final Function updateExerciseRecords;

  @override
  Widget build(BuildContext context) {
    void deleteSet(int index) {
      exerciseRecord.oneSetRecords.removeAt(index);
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Container()),
                      Text(
                        exerciseRecord.exerciseName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                deleteExerciseRecord(index);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exerciseRecord.oneSetRecords.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OneSetRecordWidget(
                        index: index,
                        deleteThis: deleteSet,
                        updateExerciseRecords: updateExerciseRecords,
                        oneSetInfo: exerciseRecord.oneSetRecords[index],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int kg = exerciseRecord.oneSetRecords.isEmpty
                          ? 0
                          : exerciseRecord.oneSetRecords.last.kg;
                      int reps = exerciseRecord.oneSetRecords.isEmpty
                          ? 0
                          : exerciseRecord.oneSetRecords.last.reps;
                      var setRecord = OneSetRecord();
                      setRecord.kg = kg;
                      setRecord.reps = reps;
                      exerciseRecord.oneSetRecords.add(setRecord);
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
