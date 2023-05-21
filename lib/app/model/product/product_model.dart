class ProductModel {
  final int id;
  final String englishName;
  final String urduName;
  final String description;
  final String unit;
  final int regularPrice;
  final int salePrice;
  final String imageUrl;
  final int status;
  final String createAt;
  final String updateAt;

  ProductModel({
    required this.id,
    required this.englishName,
    required this.urduName,
    required this.description,
    required this.unit,
    required this.regularPrice,
    required this.salePrice,
    required this.imageUrl,
    required this.status,
    required this.createAt,
    required this.updateAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      englishName: json['english_name'],
      urduName: json['urdu_name'],
      description: json['description'],
      unit: json['unit'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      imageUrl: json['img_url'],
      status: json['status'],
      createAt: json['created_at'],
      updateAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "english_name": englishName,
      "urdu_name": urduName,
      "description": description,
      "unit": unit,
      "regular_price": regularPrice,
      "sale_price": salePrice,
      "img_url": imageUrl,
      "status": status,
      "created_at": createAt,
      "updated_at": updateAt,
    };
  }
}
