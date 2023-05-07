class UserModel {
  UserModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
