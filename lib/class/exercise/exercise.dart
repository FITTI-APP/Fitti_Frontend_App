class Exercise {
  String name;
  bool isCreated;
  Exercise(this.name, this.isCreated);
  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isCreated = json['isCreated'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'isCreated': isCreated,
      };
}
