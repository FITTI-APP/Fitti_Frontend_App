import 'package:fitti_frontend_app/class/user/role.dart';

class User {
  String name;
  String email;
  String password;
  Role role;
  String id;
  User(this.name, this.email, this.password, this.role, this.id);
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        role = Role.fromJson(json['role']),
        id = json['id'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'role': role.toJson(),
        'id': id,
      };
}
