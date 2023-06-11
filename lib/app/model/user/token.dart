class AuthModel {
  String? token;

  int? uId;
  String? firstName;
  String? lastName;
  String? email;

  AuthModel({this.token, this.uId, this.firstName, this.lastName, this.email});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      uId: json['user']['id'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
    );
  }
}

class SignUpToken {
  String? token;

  SignUpToken({required this.token});

  factory SignUpToken.fromJson(Map<String, dynamic> json) {
    return SignUpToken(token: json['token']);
  }
}
