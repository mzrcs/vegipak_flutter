class AreaModel {
  List<DistrictAreas>? districtAreas;

  AreaModel({this.districtAreas});

  AreaModel.fromJson(Map<String, dynamic> json) {
    if (json['DistrictAreas'] != null) {
      districtAreas = <DistrictAreas>[];
      json['DistrictAreas'].forEach((v) {
        districtAreas!.add(DistrictAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (districtAreas != null) {
      data['DistrictAreas'] =
          districtAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictAreas {
  int? id;
  int? cityDistrictId;
  String? name;
  String? createdAt;
  String? updatedAt;

  DistrictAreas(
      {this.id,
      this.cityDistrictId,
      this.name,
      this.createdAt,
      this.updatedAt});

  DistrictAreas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityDistrictId = json['city_district_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['city_district_id'] = cityDistrictId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
