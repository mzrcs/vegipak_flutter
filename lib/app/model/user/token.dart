class AuthModel {
  String? token;

  int uId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  AuthModel({
    required this.uId,
    this.token,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      uId: json['user']['id'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
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
