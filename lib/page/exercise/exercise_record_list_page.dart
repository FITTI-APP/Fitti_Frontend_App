import 'dart:convert';
import 'package:fitti_frontend_app/class/exercise/day_exercise_record.dart';
import 'package:fitti_frontend_app/class/exercise/one_exercise_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExerciseRecordListPage extends StatefulWidget {
  ExerciseRecordListPage({super.key, required this.recordExistingEntries}) {
    recordExistingEntries.sort((a, b) => (b.key).compareTo(a.key));
  }

  final List<MapEntry<String, DayExerciseRecord>> recordExistingEntries;

  @override
  State<ExerciseRecordListPage> createState() => _ExerciseRecordListPageState();
}

class _ExerciseRecordListPageState extends State<ExerciseRecordListPage> {
  late List<List<bool>> isSelectedExercise;

  @override
  void initState() {
    super.initState();
    isSelectedExercise = List.filled(widget.recordExistingEntries.length,
        List.filled(0, false, growable: true),
        growable: true);
    for (var i = 0; i < widget.recordExistingEntries.length; i++) {
      isSelectedExercise[i] = List.filled(
          widget.recordExistingEntries[i].value.oneExerciseRecords.length,
          false,
          growable: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('운동 기록 불러오기'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.recordExistingEntries.length,
                itemBuilder: (context, dayIndex) {
                  var dayString = widget.recordExistingEntries[dayIndex].key;
                  var parsedDay = DateTime.parse(dayString);
                  var oneExerciseRecords = widget
                      .recordExistingEntries[dayIndex].value.oneExerciseRecords;
                  return ExpansionTile(
                      title:
                          Text(DateFormat("yyyy년 MM월 dd일").format(parsedDay)),
                      children: [
                        SizedBox(
                          height: 20,
                          child: IconButton(
                            splashRadius: 20,
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                for (var i = 0;
                                    i < isSelectedExercise[dayIndex].length;
                                    i++) {
                                  isSelectedExercise[dayIndex][i] = true;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.done,
                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: oneExerciseRecords.length,
                            itemBuilder: (context, volumeIndex) {
                              return CheckboxListTile(
                                value: isSelectedExercise[dayIndex]
                                    [volumeIndex],
                                onChanged: (value) {
                                  setState(() {
                                    isSelectedExercise[dayIndex][volumeIndex] =
                                        value ?? false;
                                  });
                                },
                                title: Text(oneExerciseRecords[volumeIndex]
                                    .exerciseName),
                              );
                            })
                      ]);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  var selectedExerciseRecords = <OneExerciseRecord>[];
                  for (var i = 0; i < isSelectedExercise.length; i++) {
                    for (var j = 0; j < isSelectedExercise[i].length; j++) {
                      if (isSelectedExercise[i][j]) {
                        var mapData = jsonDecode(jsonEncode(widget
                            .recordExistingEntries[i]
                            .value
                            .oneExerciseRecords[j])) as Map<String, dynamic>;
                        var deepCopiedOneExerciseRecord =
                            OneExerciseRecord.fromJson(mapData);
                        selectedExerciseRecords
                            .add(deepCopiedOneExerciseRecord);
                      }
                    }
                  }
                  Get.back(result: selectedExerciseRecords);
                },
                child: const Text("선택한 운동 기록 불러오기"),
              )
            ],
          ),
        ));
  }
}
