class SignInModel {
  SignInModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class VerifyOTPModel {
  VerifyOTPModel({
    required this.email,
    required this.otp,
  });

  String email;
  String otp;

  factory VerifyOTPModel.fromJson(Map<String, dynamic> json) => VerifyOTPModel(
        email: json["email"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
      };
}

class UpdatePasswordModel {
  UpdatePasswordModel({
    required this.oldPassword,
    required this.newPassword,
  });

  String oldPassword;
  String newPassword;

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordModel(
        oldPassword: json["old_password"],
        newPassword: json["new_password"],
      );

  // Map<String, dynamic> toJson() => {
  //       "old_password": oldPassword,
  //       "new_password": newPassword,
  //     };

  Map<String, dynamic> updateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}
