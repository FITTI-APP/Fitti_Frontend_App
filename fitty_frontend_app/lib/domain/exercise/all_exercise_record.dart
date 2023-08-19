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

  List<MapEntry<String, DayExerciseRecord>> get recordExistingEntries {
    var entries = _dateTimeToDayExerciseRecordMap.entries.toList();
    List<MapEntry<String, DayExerciseRecord>> result = [];
    for (var entry in entries) {
      if (entry.value.oneExerciseRecords.isNotEmpty) result.add(entry);
    }
    return result;
  }

  DayExerciseRecord getDayExerciseRecord(DateTime dateTime) {
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
  List<OneExerciseRecord> oneExerciseRecords = [];
  // todo : 시간 등등 기록
  DayExerciseRecord();
  DayExerciseRecord.fromJson(Map<String, dynamic> json)
      : oneExerciseRecords = List<OneExerciseRecord>.from(
            json['oneExerciseRecords']
                .map((value) => OneExerciseRecord.fromJson(value)));
  Map<String, dynamic> toJson() {
    return {
      'oneExerciseRecords': oneExerciseRecords,
    };
  }
}

class OneExerciseRecord {
  String exerciseName = "";
  List<OneSetRecord> oneSetRecords = [];
  OneExerciseRecord();
  OneExerciseRecord.fromJson(Map<String, dynamic> json)
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
  int weight = 0;
  int reps = 0;
  OneSetRecord();
  OneSetRecord.fromJson(Map<String, dynamic> json)
      : weight = json['weight'],
        reps = json['reps'];
  Map<String, dynamic> toJson() => {
        'weight': weight,
        'reps': reps,
      };
}
