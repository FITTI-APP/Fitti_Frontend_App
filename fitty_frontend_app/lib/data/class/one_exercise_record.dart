import 'package:fitty_frontend_app/data/class/one_set_record.dart';

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
