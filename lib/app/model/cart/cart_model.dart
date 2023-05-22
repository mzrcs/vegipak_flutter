import 'package:vegipak/app/model/product/product_model.dart';

class CartModel {
  final int quantity;
  ProductModel product;

  CartModel({
    required this.quantity,
    required this.product,
  });
}
