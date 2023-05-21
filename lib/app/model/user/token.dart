
class AuthModel {
  String? token;
  String? firstName;
  String? lastName;
  String? email;

  AuthModel({this.token, this.firstName, this.lastName, this.email});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
    );
  }
}
