import 'dart:ffi';

import 'package:fitti_frontend_app/class/exercise/exercise_exercise_record.dart';

class ExerciseSetRecord {
  ExerciseExerciseRecord exerciseExerciseRecord;
  int order;
  Float weight;
  int reps;
  Duration totalTime;
  String memo;
  Float distance;
  String id;

  ExerciseSetRecord(this.exerciseExerciseRecord, this.order, this.weight,
      this.reps, this.totalTime, this.memo, this.distance, this.id);
  ExerciseSetRecord.fromJson(Map<String, dynamic> json)
      : exerciseExerciseRecord =
            ExerciseExerciseRecord.fromJson(json['exerciseExerciseRecord']),
        order = json['order'],
        weight = json['weight'],
        reps = json['reps'],
        totalTime = json['totalTime'],
        memo = json['memo'],
        distance = json['distance'],
        id = json['id'];
  Map<String, dynamic> toJson() => {
        'exerciseExerciseRecord': exerciseExerciseRecord.toJson(),
        'order': order,
        'weight': weight,
        'reps': reps,
        'totalTime': totalTime,
        'memo': memo,
        'distance': distance,
        'id': id,
      };
}
