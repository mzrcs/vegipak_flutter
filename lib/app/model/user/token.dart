class AuthModel {
  String? token;
  int uId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  int? districtAreaId;
  int? status;


  AuthModel({
    required this.uId,
    this.token,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.districtAreaId,
    this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      uId: json['user']['id'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      address: json['user']['address'],
      districtAreaId: json['user']['district_area_id'],
      status: json['user']['status'],
    );
  }
}

class SignUpAuthModel {
  String? userEmail;

  SignUpAuthModel({required this.userEmail});

  factory SignUpAuthModel.fromJson(Map<String, dynamic> json) {
    return SignUpAuthModel(userEmail: json['user_email']);
  }
}
