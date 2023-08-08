import 'package:vegipak/app/model/product/product_model.dart';

class CartModel {
  int? id;
  int? orderId;
  int? productId;
  int? productPrice;
  int quantity;
  String? createdAt;
  String? updatedAt;
  ProductModel product;

  CartModel({
    this.id,
    this.orderId,
    this.productId,
    required this.quantity,
    this.productPrice,
    this.createdAt,
    this.updatedAt,
    required this.product,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      quantity: json['qty'],
      productPrice: json['product_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: ProductModel.fromJson(json['products']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_id": product.id,
      "qty": quantity,
      "product_price": product.salePrice,
    };
  }
}
