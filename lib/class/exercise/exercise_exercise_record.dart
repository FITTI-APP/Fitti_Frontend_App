import 'package:fitti_frontend_app/class/exercise/exercise.dart';
import 'package:fitti_frontend_app/class/exercise/exercise_session_record.dart';
import 'package:fitti_frontend_app/class/exercise/exercise_set_record.dart';

class ExerciseExerciseRecord {
  ExerciseSessionRecord exerciseSessionRecord;
  Exercise exercise;
  int order;
  String memo;
  String id;
  List<ExerciseSetRecord> exerciseSetRecords;

  ExerciseExerciseRecord(this.exerciseSessionRecord, this.exercise, this.order,
      this.memo, this.id, this.exerciseSetRecords);
  ExerciseExerciseRecord.fromJson(Map<String, dynamic> json)
      : exerciseSessionRecord =
            ExerciseSessionRecord.fromJson(json['exerciseSessionRecord']),
        exercise = Exercise.fromJson(json['exercise']),
        order = json['order'],
        memo = json['memo'],
        id = json['id'],
        exerciseSetRecords = json['exerciseSetRecords']
            .map<ExerciseSetRecord>((json) => ExerciseSetRecord.fromJson(json))
            .toList();
  Map<String, dynamic> toJson() => {
        'exerciseSessionRecord': exerciseSessionRecord.toJson(),
        'exercise': exercise.toJson(),
        'order': order,
        'memo': memo,
        'id': id,
        'exerciseSetRecords': exerciseSetRecords
            .map((exerciseSetRecord) => exerciseSetRecord.toJson())
            .toList(),
      };
}
