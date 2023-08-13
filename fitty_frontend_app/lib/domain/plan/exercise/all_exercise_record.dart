import 'package:flutter/material.dart';

class AllExerciseRecord extends ChangeNotifier {
  final Map<DateTime, DayExerciseRecord> _dateTimeToDayExerciseRecordMap = {};

  DayExerciseRecord getExerciseRecords(DateTime dateTime) {
    var dateOnly = DateUtils.dateOnly(dateTime);
    if (_dateTimeToDayExerciseRecordMap[dateOnly] == null) {
      _dateTimeToDayExerciseRecordMap[dateOnly] = DayExerciseRecord();
    }
    return _dateTimeToDayExerciseRecordMap[dateOnly]!;
  }

  void updateExerciseRecords() {
    notifyListeners();
  }
}

class DayExerciseRecord {
  List<ExerciseRecord> exerciseRecords = [];
  // todo : 시간 등등 기록
}

class ExerciseRecord {
  String exerciseName;
  List<SetRecord> setRecords = [];
  ExerciseRecord({required this.exerciseName});
  // todo : 얘도 시간 등등 기록
}

class SetRecord {
  int kg;
  int reps;
  SetRecord({required this.kg, required this.reps});
}
