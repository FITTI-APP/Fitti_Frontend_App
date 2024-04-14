import 'package:fitti_frontend_app/class/exercise/exercise_exercise_record.dart';
import 'package:fitti_frontend_app/class/exercise/exercise_save_type.dart';
import 'package:fitti_frontend_app/class/user/user.dart';

class ExerciseSessionRecord {
  User user;
  DateTime startTime;
  DateTime endTime;
  String memo;
  String id;
  ExerciseSaveType exerciseSaveType;
  List<ExerciseExerciseRecord> exerciseExerciseRecords;

  ExerciseSessionRecord(this.user, this.startTime, this.endTime, this.memo,
      this.id, this.exerciseSaveType, this.exerciseExerciseRecords);
  ExerciseSessionRecord.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']),
        startTime = json['startTime'],
        endTime = json['endTime'],
        memo = json['memo'],
        id = json['id'],
        exerciseSaveType = ExerciseSaveType.fromJson(json['exerciseSaveType']),
        exerciseExerciseRecords = json['exerciseExerciseRecords']
            .map<ExerciseExerciseRecord>(
                (json) => ExerciseExerciseRecord.fromJson(json))
            .toList();
  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'startTime': startTime,
        'endTime': endTime,
        'memo': memo,
        'id': id,
        'exerciseSaveType': exerciseSaveType.toJson(),
        'exerciseExerciseRecords': exerciseExerciseRecords
            .map((exerciseExerciseRecord) => exerciseExerciseRecord.toJson())
            .toList(),
      };
}
