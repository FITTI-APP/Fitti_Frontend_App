class ExerciseKind {
  String name;
  int id;
  ExerciseKind(this.name, this.id);
  ExerciseKind.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
