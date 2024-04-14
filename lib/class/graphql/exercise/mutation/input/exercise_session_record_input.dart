import 'package:fitti_frontend_app/class/graphql/exercise/mutation/input/exercise_exercise_record_input.dart';

class ExerciseSessionRecordInput {
  int? exerciseSessionRecordId;
  String memo;
  DateTime startTime;
  DateTime endTime;
  int exerciseSaveTypeId;
  List<ExerciseExerciseRecordInput> exerciseExerciseRecordInputs;

  ExerciseSessionRecordInput(
      {this.exerciseSessionRecordId,
      required this.memo,
      required this.startTime,
      required this.endTime,
      required this.exerciseSaveTypeId,
      required this.exerciseExerciseRecordInputs});
  ExerciseSessionRecordInput.fromJson(Map<String, dynamic> json)
      : exerciseSessionRecordId = json['exerciseSessionRecordId'],
        memo = json['memo'],
        startTime = DateTime.parse(json['startTime']),
        endTime = DateTime.parse(json['endTime']),
        exerciseSaveTypeId = json['exerciseSaveTypeId'],
        exerciseExerciseRecordInputs = json['exerciseExerciseRecordInputs']
            .map<ExerciseExerciseRecordInput>(
                (json) => ExerciseExerciseRecordInput.fromJson(json))
            .toList();
  Map<String, dynamic> toJson() => {
        'exerciseSessionRecordId': exerciseSessionRecordId,
        'memo': memo,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'exerciseSaveTypeId': exerciseSaveTypeId,
        'exerciseExerciseRecordInputs': exerciseExerciseRecordInputs
            .map((exerciseExerciseRecordInput) =>
                exerciseExerciseRecordInput.toJson())
            .toList(),
      };
}
