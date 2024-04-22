import 'package:fitti_frontend_app/class/exercise/one_exercise_record.dart';
import 'package:fitti_frontend_app/class/exercise/one_set_record.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/button/main_button_widget.dart';
import 'package:fitti_frontend_app/widget/exercise/one_exercise_records_of_all_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.all(8.h),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Container(
              width: 344.w,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.h),
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
                                      height: 550.h,
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
                        style: TextStyle(
                          fontSize: 15.sp,
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
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: oneExerciseRecord.oneSetRecords.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRect(
                          child: Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              deleteSet(index);
                            },
                            background: Container(
                              color: setDeleteRedColor,
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            child: OneSetRecordWidget(
                              index: index,
                              oneSetInfo:
                                  oneExerciseRecord.oneSetRecords[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MainButton(
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
                    width: 86.w,
                    height: 35.h,
                    backgroundColor: Colors.black,
                    text: "세트 추가",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
