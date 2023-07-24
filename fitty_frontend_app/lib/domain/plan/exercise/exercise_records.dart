import 'package:flutter/material.dart';

class ExerciseRecords extends ChangeNotifier {
  final Map<DateTime, ExerciseRecordOfADay> _dateTimeExercises = {};

  void createExerciseRecords(DateTime dateTime) {
    _dateTimeExercises[dateTime] = ExerciseRecordOfADay();
    notifyListeners();
  }

  void updateExerciseRecords(
      DateTime dateTime, ExerciseRecordOfADay exerciseRecordOfADay) {
    _dateTimeExercises[dateTime] = exerciseRecordOfADay;
    notifyListeners();
  }

  void deleteExerciseRecords(DateTime dateTime) {
    _dateTimeExercises.remove(dateTime);
    notifyListeners();
  }
}

class ExerciseRecordOfADay {
  List<ExerciseRecord> exerciseRecords = [];
}

class ExerciseRecord {
  String exerciseName;
  List<OneSetInfo> oneSetInfos = [];
  ExerciseRecord({required this.exerciseName});
}

class OneSetInfo {
  int kg;
  int reps;
  OneSetInfo({required this.kg, required this.reps});
}
