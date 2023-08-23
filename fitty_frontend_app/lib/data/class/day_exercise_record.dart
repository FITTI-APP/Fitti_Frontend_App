import 'package:fitty_frontend_app/data/class/one_exercise_record.dart';

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
