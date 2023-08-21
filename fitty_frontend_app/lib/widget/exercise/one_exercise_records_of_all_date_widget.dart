import 'dart:math';

import 'package:fitty_frontend_app/data/all_exercise_record.dart';
import 'package:fitty_frontend_app/utility/exercise_data_processer.dart';
import 'package:fitty_frontend_app/widget/exercise/one_set_record_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OneExerciseRecordsOfAllDateWidget extends StatefulWidget {
  const OneExerciseRecordsOfAllDateWidget(
      {super.key, required this.exersiseName});

  final String exersiseName;

  @override
  State<OneExerciseRecordsOfAllDateWidget> createState() =>
      _OneExerciseRecordsOfAllDateWidgetState();
}

class _OneExerciseRecordsOfAllDateWidgetState
    extends State<OneExerciseRecordsOfAllDateWidget> {
  late int index;
  late List<MapEntry<String, OneExerciseRecord>>
      oneExerciseRecordOfAllDateEntries;

  @override
  void initState() {
    super.initState();
    var allExerciseRecord = context.read<AllExerciseRecord>();
    var oneExerciseRecordsOfAllDate = ExerciseDataProcesser
        .getOneExerciseRecordsOfAllDateFromAllExerciseRecord(
            allExerciseRecord, widget.exersiseName);
    oneExerciseRecordOfAllDateEntries =
        oneExerciseRecordsOfAllDate.entries.toList();
    oneExerciseRecordOfAllDateEntries.sort((a, b) => a.key.compareTo(b.key));
    index = oneExerciseRecordsOfAllDate.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate =
        DateTime.parse(oneExerciseRecordOfAllDateEntries[index].key);
    var oneSetRecords =
        oneExerciseRecordOfAllDateEntries[index].value.oneSetRecords;
    var totalVolume = oneExerciseRecordOfAllDateEntries[index]
        .value
        .oneSetRecords
        .map((e) => e.weight * e.reps)
        .reduce((value, element) => value + element);

    int maxWeight = 0;
    for (var element in oneSetRecords) {
      if (element.weight > maxWeight) {
        maxWeight = element.weight;
      }
    }

    double expected1RM = 0;
    for (var element in oneSetRecords) {
      expected1RM = max(expected1RM, element.weight * (1 + element.reps / 30));
    }
    ;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.exersiseName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (index > 0) {
                      index--;
                    }
                  });
                },
                icon: const Icon(Icons.arrow_back_ios_outlined)),
            Text(
              DateFormat("MM월 dd일").format(selectedDate),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (index < oneExerciseRecordOfAllDateEntries.length - 1) {
                      index++;
                    }
                  });
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: oneExerciseRecordOfAllDateEntries[index]
              .value
              .oneSetRecords
              .length,
          itemBuilder: (BuildContext context, int setRecordIndex) {
            var oneSetRecords =
                oneExerciseRecordOfAllDateEntries[index].value.oneSetRecords;
            var oneSetRecord = oneSetRecords[setRecordIndex];
            return Center(
              child: Text(
                "${setRecordIndex + 1}세트 : ${oneSetRecord.weight}kg x ${oneSetRecord.reps}회",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text("총 볼륨 : ${totalVolume}kg",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            Text("최대 중량 : ${maxWeight}kg",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            Text("예상 1RM : ${expected1RM.toStringAsFixed(1)}kg",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            foregroundColor: Colors.blue, // Set button background color
          ),
          child: const Text(
            '불러오기',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
