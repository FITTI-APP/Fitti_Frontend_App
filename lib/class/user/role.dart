class Role {
  String name;
  String id;
  Role(this.name, this.id);
  Role.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
