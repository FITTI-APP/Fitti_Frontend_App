class Exercise_ {
  String name;
  bool isCreated;

  Exercise_(this.name, this.isCreated);
  Exercise_.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isCreated = json['isCreated'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'isCreated': isCreated,
      };
}
