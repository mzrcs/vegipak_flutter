import 'dart:core';

import '../cart/cart_model.dart';

// import '../cart/cart_model.dart';

class MyOrderModel {
  final int? id;
  final int userId;
  final String phone;
  final int areaId;
  final String address;
  final String note;
  final String status;
  final int total;
  final List<CartModel>? cartItems;
  String? createdAt;
  String? updatedAt;

  MyOrderModel({
    this.id,
    required this.userId,
    required this.phone,
    required this.areaId,
    required this.address,
    required this.note,
    required this.status,
    required this.total,
    this.cartItems,
    this.createdAt,
    this.updatedAt,
  });


  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      id: json['id'],
      userId: json['user_id'],
      phone: json['phone'],
      areaId: json['district_area_id'],
      address: json['address'],
      note: json['extra_notes'],
      status: json['status'],
      total: json['total_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      cartItems: List.from(json['line_items'])
          .map((e) => CartModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "phone": phone,
      "district_area_id": areaId,
      "address": address,
      "extra_notes": note,
      "status": status,
      "total_price": total,
      'line_items': cartItems!.map((item) => item.toJson()).toList(),
    };
  }
}
