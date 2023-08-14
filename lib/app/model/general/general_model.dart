class General {
  List<GeneralModel>? generalSetting;

  General({this.generalSetting});

  General.fromJson(Map<String, dynamic> json) {
    if (json['GeneralSettings'] != null) {
      generalSetting = <GeneralModel>[];
      json['GeneralSettings'].forEach((v) {
        generalSetting!.add(GeneralModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (districtAreas != null) {
  //     data['DistrictAreas'] = districtAreas!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class GeneralModel {
  int? id;
  String? key;
  String? value;
  String? createAt;
  String? updateAt;

  GeneralModel({
    this.id,
    this.key,
    this.value,
    this.createAt,
    this.updateAt,
  });

  GeneralModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
    createAt = json['created_at'];
    updateAt = json['updated_at'];
  }


}
