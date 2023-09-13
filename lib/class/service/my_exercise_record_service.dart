import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../exercise/day_exercise_record.dart';

class MyExerciseRecordService extends ChangeNotifier {
  /// key : dateOnly.toString()
  late Map<String, DayExerciseRecord> dateTimeToDayExerciseRecordMap;

  MyExerciseRecordService();

  Future<void> initDateTimeToDayExerciseRecordMap() async {
    var prefs = await SharedPreferences.getInstance();
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

  void updateExerciseRecords() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dateTimeToDayExerciseRecordMap',
        jsonEncode(dateTimeToDayExerciseRecordMap));
  }

  void updateExerciseRecordsAndRefreshUi() {
    updateExerciseRecords();
    notifyListeners();
  }
}
