import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllExerciseRecord extends ChangeNotifier {
  Map<String, DayExerciseRecord> _dateTimeToDayExerciseRecordMap = {};
  SharedPreferences prefs;

  AllExerciseRecord(this.prefs) {
    var encodedData = prefs.getString('dateTimeToDayExerciseRecordMap');
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
    prefs.setString('dateTimeToDayExerciseRecordMap',
        jsonEncode(_dateTimeToDayExerciseRecordMap));
    notifyListeners();
  }
}

class DayExerciseRecord {
  List<VolumeRecord> volumeRecords = [];
  // todo : 시간 등등 기록
  DayExerciseRecord();
  DayExerciseRecord.fromJson(Map<String, dynamic> json)
      : volumeRecords = List<VolumeRecord>.from(
            json['volumeRecords'].map((value) => VolumeRecord.fromJson(value)));
  Map<String, dynamic> toJson() {
    return {
      'volumeRecords': volumeRecords,
    };
  }
}

class VolumeRecord {
  String exerciseName = "";
  List<OneSetRecord> oneSetRecords = [];
  VolumeRecord();
  VolumeRecord.fromJson(Map<String, dynamic> json)
      : exerciseName = json['exerciseName'],
        oneSetRecords = List<OneSetRecord>.from(
            json['oneSetRecords'].map((value) => OneSetRecord.fromJson(value)));
  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'oneSetRecords': oneSetRecords,
    };
  }
  // todo : 얘도 시간 등등 기록
}

class OneSetRecord {
  int kg = 0;
  int reps = 0;
  OneSetRecord();
  OneSetRecord.fromJson(Map<String, dynamic> json)
      : kg = json['kg'],
        reps = json['reps'];
  Map<String, dynamic> toJson() => {
        'kg': kg,
        'reps': reps,
      };
}
