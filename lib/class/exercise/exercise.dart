import 'package:fitti_frontend_app/class/exercise/exercise_kind.dart';

class Exercise {
  String name;
  ExerciseKind exerciseKind;
  String id;

  Exercise(this.name, this.exerciseKind, this.id);
  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        exerciseKind = ExerciseKind.fromJson(json['exerciseKind']),
        id = json['id'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'exerciseKind': exerciseKind.toJson(),
        'id': id,
      };
}
