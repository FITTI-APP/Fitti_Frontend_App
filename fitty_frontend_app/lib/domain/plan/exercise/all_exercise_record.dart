import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllExerciseRecord extends ChangeNotifier {
  Map<String, DayExerciseRecord> _dateTimeToDayExerciseRecordMap = {};
  SharedPreferences prefs;

  AllExerciseRecord(this.prefs) {
    var encodedData = prefs.getString('exerciseRecords');
    if (encodedData != null) {
      var decodedData = jsonDecode(encodedData);
      _dateTimeToDayExerciseRecordMap =
          Map<String, DayExerciseRecord>.from(decodedData.map((key, value) {
        return MapEntry(key, DayExerciseRecord.fromJson(value));
      }));
    } else {
      _dateTimeToDayExerciseRecordMap = {};
    }
  }

  DayExerciseRecord getExerciseRecords(DateTime dateTime) {
    var dateOnly = DateUtils.dateOnly(dateTime);
    if (_dateTimeToDayExerciseRecordMap[dateOnly.toString()] == null) {
      _dateTimeToDayExerciseRecordMap[dateOnly.toString()] =
          DayExerciseRecord();
    }
    return _dateTimeToDayExerciseRecordMap[dateOnly.toString()]!;
  }

  void updateExerciseRecords() {
    prefs.setString(
        'exerciseRecords', jsonEncode(_dateTimeToDayExerciseRecordMap));
    notifyListeners();
  }
}

class DayExerciseRecord {
  List<ExerciseRecord> exerciseRecords = [];
  // todo : 시간 등등 기록
  DayExerciseRecord();
  DayExerciseRecord.fromJson(Map<String, dynamic> json)
      : exerciseRecords = List<ExerciseRecord>.from(json['exerciseRecords']
            .map((value) => ExerciseRecord.fromJson(value)));
  Map<String, dynamic> toJson() {
    return {
      'exerciseRecords': exerciseRecords,
    };
  }
}

class ExerciseRecord {
  String exerciseName = "";
  List<SetRecord> setRecords = [];
  ExerciseRecord();
  ExerciseRecord.fromJson(Map<String, dynamic> json)
      : exerciseName = json['exerciseName'],
        setRecords = List<SetRecord>.from(
            json['setRecords'].map((value) => SetRecord.fromJson(value)));
  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'setRecords': setRecords,
    };
  }
  // todo : 얘도 시간 등등 기록
}

class SetRecord {
  int kg = 0;
  int reps = 0;
  SetRecord();
  SetRecord.fromJson(Map<String, dynamic> json)
      : kg = json['kg'],
        reps = json['reps'];
  Map<String, dynamic> toJson() => {
        'kg': kg,
        'reps': reps,
      };
}
