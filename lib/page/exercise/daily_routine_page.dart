import 'dart:async';

import 'package:fitti_frontend_app/class/service/my_exercise_record_service.dart';
import 'package:fitti_frontend_app/class/exercise/one_exercise_record.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:fitti_frontend_app/widget/appbar/custom_appbar.dart';
import 'package:fitti_frontend_app/widget/button/main_button_widget.dart';
import 'package:fitti_frontend_app/widget/exercise/one_exercise_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../class/exercise/day_exercise_record.dart';
import 'exercise_list_page.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({super.key, required this.selectedDay});

  final DateTime selectedDay;

  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage> {
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

  Timer? _timer;

  int _seconds = 0;

  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _seconds = 0;
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        "My Exercise",
        const [
          Icon(Icons.share),
          Icon(Icons.bar_chart),
          Icon(Icons.more_vert),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(
        isTimerRunning: _isRunning,
        timerText: _seconds,
        onToggleTimer: _startTimer,
        onCompleteExercise: _resetTimer,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Consumer<MyExerciseRecordService>(
            builder: (context, allExerciseRecord, child) {
              var selectedDayExerciseRecord =
                  allExerciseRecord.getDayExerciseRecord(widget.selectedDay);
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
                  if (selectedDayExerciseRecord.oneExerciseRecords.length == 0)
                    // to do 디자인 완성후 수정
                    Text('운동을 추가해주세요'),
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
                        child: const Text('운동 추가하기',
                            style: TextStyle(color: Colors.black)),
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
          ),
        ),
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  final bool isTimerRunning;
  final int timerText;
  final Function onToggleTimer;
  final Function onCompleteExercise;

  const BottomBarWidget({
    super.key,
    required this.isTimerRunning,
    required this.timerText,
    required this.onToggleTimer,
    required this.onCompleteExercise,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 140.h,
      child: Stack(
        children: [
          Positioned(
            left: 130.w,
            top: 0.h,
            child: Container(
              width: 100.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.w,
            top: 20.h,
            child: Container(
              width: 360.w,
              height: 120.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 23.h,
                    ),
                    child: Text(
                      formatTime(timerText),
                      style: TextStyle(
                        color: greenColor,
                        fontSize: 24.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onToggleTimer(),
                    child: Icon(
                      isTimerRunning ? Icons.pause : Icons.play_arrow,
                      size: 40.h,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 130.w,
            top: 8.h,
            child: Container(
              width: 100.w,
              height: 20.h,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 135.w,
            top: 5.h,
            child: MainButton(
              onPressed: () => onCompleteExercise(),
              width: 90,
              height: 35,
              backgroundColor: finishExerciseButtonColor,
              text: '운동 완료',
              fontSize: 12,
              side: const BorderSide(
                color: greyColor,
              ),
            ),
          ),
        ],
      ),
    );

    // Container(
    //   decoration: BoxDecoration(
    //     boxShadow: const [
    //       BoxShadow(
    //         color: shadowColor,
    //         spreadRadius: 1,
    //         blurRadius: 2,
    //       ),
    //     ],
    //     border: Border(
    //       top: BorderSide(width: 1.0, color: Colors.grey.shade300),
    //     ),
    //   ),
    //   child: BottomAppBar(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         IconButton(
    //           icon: Icon(isTimerRunning ? Icons.pause : Icons.play_arrow),
    //           onPressed: () => onToggleTimer(),
    //         ),
    //         Text(timerText),
    //         MainButton(
    //           onPressed: () => onCompleteExercise(),
    //           width: 86.w,
    //           height: 34.h,
    //           backgroundColor: finishExerciseButtonColor,
    //           text: '운동 완료',
    //           side: const BorderSide(
    //             color: greyColor,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

String formatTime(int seconds) {
  // 시간, 분, 초 계산
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int sec = seconds % 60;

  // "HH:mm:ss" 형식으로 포매팅
  String hoursStr = (hours >= 10) ? hours.toString() : "0$hours";
  String minutesStr = (minutes >= 10) ? minutes.toString() : "0$minutes";
  String secondsStr = (sec >= 10) ? sec.toString() : "0$sec";

  return "$hoursStr:$minutesStr:$secondsStr";
}
