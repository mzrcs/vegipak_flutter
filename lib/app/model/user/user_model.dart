class UserModel {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  String? type;
  late String phone;
  String? emailVerifiedAt;
  int? districtAreaId;
  late String address;
  String? profilePicture;
  int? status;
  String? isBlock;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.type,
    this.phone = '',
    this.emailVerifiedAt,
    this.districtAreaId,
    this.address = '',
    this.profilePicture,
    this.status,
    this.isBlock,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    type = json['type'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    districtAreaId = json['district_area_id'];
    address = json['address'];
    profilePicture = json['profile_picture'];
    status = json['status'];
    isBlock = json['is_block'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['type'] = type;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['district_area_id'] = districtAreaId;
    data['address'] = address;
    data['profile_picture'] = profilePicture;
    data['status'] = status;
    data['is_block'] = isBlock;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  Map<String, dynamic> updateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['type'] = type;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['district_area_id'] = districtAreaId;
    data['status'] = status;
    return data;
  }
}
