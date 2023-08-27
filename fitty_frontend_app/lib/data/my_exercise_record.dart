import 'dart:convert';
import 'package:fitty_frontend_app/data/class/day_exercise_record.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyExerciseRecord extends ChangeNotifier {
  Map<String, DayExerciseRecord> dateTimeToDayExerciseRecordMap = {};
  SharedPreferences prefs;

  MyExerciseRecord(this.prefs) {
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
