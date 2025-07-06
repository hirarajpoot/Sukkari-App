// Path: lib/models/user_model.dart

class User {
  String? name;
  String email;
  String? password;
  String? gender;
  String? diabetesType;

  User({
    this.name,
    required this.email,
    this.password,
    this.gender,
    this.diabetesType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      diabetesType: json['diabetesType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'diabetesType': diabetesType,
    };
  }
}
