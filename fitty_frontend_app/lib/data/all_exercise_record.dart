import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllExerciseRecord extends ChangeNotifier {
  /// key : dateOnly.toString()
  Map<String, DayExerciseRecord> dateTimeToDayExerciseRecordMap = {};
  SharedPreferences prefs;

  AllExerciseRecord(this.prefs) {
    var encodedData = prefs.getString('dateTimeToDayExerciseRecordMap');
    if (encodedData != null) {
      var decodedData = jsonDecode(encodedData);
      dateTimeToDayExerciseRecordMap =
          Map<String, DayExerciseRecord>.from(decodedData.map((key, value) {
        return MapEntry(key, DayExerciseRecord.fromJson(value));
      }));
    } else {
      dateTimeToDayExerciseRecordMap = {};
    }
  }

  List<MapEntry<String, DayExerciseRecord>> get recordExistingEntries {
    var entries = dateTimeToDayExerciseRecordMap.entries.toList();
    List<MapEntry<String, DayExerciseRecord>> result = [];
    for (var entry in entries) {
      if (entry.value.oneExerciseRecords.isNotEmpty) result.add(entry);
    }
    return result;
  }

  DayExerciseRecord getDayExerciseRecord(DateTime dateTime) {
    var dateOnly = DateUtils.dateOnly(dateTime);
    if (dateTimeToDayExerciseRecordMap[dateOnly.toString()] == null) {
      dateTimeToDayExerciseRecordMap[dateOnly.toString()] = DayExerciseRecord();
    }
    return dateTimeToDayExerciseRecordMap[dateOnly.toString()]!;
  }

  void updateExerciseRecords() {
    prefs.setString('dateTimeToDayExerciseRecordMap',
        jsonEncode(dateTimeToDayExerciseRecordMap));
    notifyListeners();
  }
}

enum DayExerciseRecordState {
  before,
  ongoing,
  end;

  // 문자열을 DayExerciseRecordState로 변환
  static DayExerciseRecordState fromString(String str) {
    switch (str) {
      case 'before':
        return DayExerciseRecordState.before;
      case 'ongoing':
        return DayExerciseRecordState.ongoing;
      case 'end':
        return DayExerciseRecordState.end;
    }
    return DayExerciseRecordState.before;
  }

  // 문자열 변환
  @override
  String toString() {
    switch (this) {
      case DayExerciseRecordState.before:
        return 'before';
      case DayExerciseRecordState.ongoing:
        return 'ongoing';
      case DayExerciseRecordState.end:
        return 'end';
    }
  }
}

class DayExerciseRecord {
  List<OneExerciseRecord> oneExerciseRecords = [];
  DayExerciseRecordState state = DayExerciseRecordState.before;
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  Duration get exerciseDuration => endTime.difference(startTime);

  DayExerciseRecord();
  DayExerciseRecord.fromJson(Map<String, dynamic> json)
      : oneExerciseRecords = List<OneExerciseRecord>.from(
            json['oneExerciseRecords']
                .map((value) => OneExerciseRecord.fromJson(value))),
        state = !json.containsKey('state')
            ? DayExerciseRecordState.before
            : DayExerciseRecordState.fromString(json['state']),
        startTime = !json.containsKey('startTime')
            ? DateTime.now()
            : DateTime.parse(json['startTime']),
        endTime = !json.containsKey('endTime')
            ? DateTime.now()
            : DateTime.parse(json['endTime']);

  Map<String, dynamic> toJson() {
    return {
      'oneExerciseRecords': oneExerciseRecords,
      'state': state.toString(),
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
      'exerciseDuration': exerciseDuration.toString(),
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
