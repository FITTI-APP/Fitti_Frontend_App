class ExerciseSaveType {
  String name;
  String id;
  ExerciseSaveType(this.name, this.id);
  ExerciseSaveType.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
