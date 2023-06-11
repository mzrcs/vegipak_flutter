import 'dart:core';
import 'package:vegipak/app/model/cart/cart_model.dart';

class MyOrderModel {
  final int userId;
  final String phone;
  final int areaId;
  final String address;
  final String note;
  final String status;
  final int total;
  final List<CartModel> cartItems;

  MyOrderModel({
    required this.userId,
    required this.phone,
    required this.areaId,
    required this.address,
    required this.note,
    required this.status,
    required this.total,
    required this.cartItems,
  });

  // factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
  //       userId: json['user_id'],
  //       phone: json['phone'],
  //       areaId: json['district_area_id'],
  //       address: json['address'],
  //       note: json['extra_notes'],
  //       status: json['status'],
  //       total: json['total_price'],
  //       cartItems: json['line_item'].map<CartModel>((e) => e.toJson()),
  //     );

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "phone": phone,
      "district_area_id": areaId,
      "address": address,
      "extra_notes": note,
      "status": status,
      "total_price": total,
      'line_items': cartItems.map((item) => item.toJson()).toList(),
    };
  }
}
