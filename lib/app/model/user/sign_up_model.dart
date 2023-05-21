class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String userType;
  final String phone;
  final int areaId;
  final String address;
  final String password;
  final bool status;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userType,
    required this.phone,
    required this.areaId,
    required this.address,
    required this.password,
    required this.status,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'],
      email: json['email'],
      userType: json['type'],
      phone: json['phone'],
      areaId: json['district_area_id'],
      address: json['address'],
      password: json['password'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "type": userType,
      "phone": phone,
      "district_area_id": areaId,
      "address": address,
      "password": password,
      "status": status,
    };
  }
}
