import 'package:fitti_frontend_app/class/graphql/exercise/mutation/input/exercise_set_record_input.dart';

class ExerciseExerciseRecordInput {
  int? exerciseExerciseRecordId;
  int exerciseId;
  int order;
  String memo;
  List<ExerciseSetRecordInput> exerciseSetRecordInputs;

  ExerciseExerciseRecordInput(
      {this.exerciseExerciseRecordId,
      required this.exerciseId,
      required this.order,
      required this.memo,
      required this.exerciseSetRecordInputs});
  ExerciseExerciseRecordInput.fromJson(Map<String, dynamic> json)
      : exerciseExerciseRecordId = json['exerciseExerciseRecordId'],
        exerciseId = json['exerciseId'],
        order = json['order'],
        memo = json['memo'],
        exerciseSetRecordInputs = json['exerciseSetRecordInputs']
            .map<ExerciseSetRecordInput>(
                (json) => ExerciseSetRecordInput.fromJson(json))
            .toList();
  Map<String, dynamic> toJson() => {
        'exerciseExerciseRecordId': exerciseExerciseRecordId,
        'exerciseId': exerciseId,
        'order': order,
        'memo': memo,
        'exerciseSetRecordInputs': exerciseSetRecordInputs
            .map((exerciseSetRecordInput) => exerciseSetRecordInput.toJson())
            .toList(),
      };
}
