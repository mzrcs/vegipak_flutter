import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vegipak/app/model/cart/cart_model.dart';
import 'package:vegipak/app/utils/utils.dart';

class CartProvider extends ChangeNotifier {
  bool tapField = false;
  int quantity = 1;
  TextEditingController qtyController = TextEditingController();

  void tap() {
    tapField = !tapField;
    qtyController.text = quantity.toString();
    notifyListeners();
  }

  List<CartModel> cartList = [];
  CartModel? cartModel;

  int get totalProductCount => cartList.length;

  void increaseQty() {
    quantity++;
    qtyController.text = quantity.toString();
    notifyListeners();
  }

  void decreaseQty() {
    if (quantity > 1) {
      quantity--;
      qtyController.text = quantity.toString();
    }
    notifyListeners();
  }

  void updateQtyValue(String value) {
    quantity = int.parse(value);
    notifyListeners();
  }

  void addToCart(CartModel cartItem, BuildContext context) {
    if (quantity > 0) {
      cartList.add(cartItem);
      Utils.snackBarPopUp(context, "Added To Cart Successfully", Colors.green);
    }
    notifyListeners();
    quantity = 1;
  }

  void removeToCart(CartModel cartItem, BuildContext context) {
    cartList.remove(cartItem);
    Utils.snackBarPopUp(context, "Removed From Cart Successfully", Colors.red);
    notifyListeners();
  }

  double get subTotal {
    double subTotal = 0;
    for (int i = 0; i < cartList.length; i++) {
      subTotal += cartList[i].product.salePrice * cartList[i].quantity;
    }
    return double.parse(subTotal.toStringAsFixed(4));
  }

  Future<void> orderNow() async {
    Map<String, dynamic> data = {
      "user_id": 1,
      "phone": "0335233451",
      "district_area_id": 8,
      "address": "Addresss ASD",
      "extra_notes": "Hello Buddy",
      "status": "pending",
      "total_price": int.parse(subTotal.toStringAsFixed(0)),
      "line_items": cartList.map((e) => e.toJson()).toList(),
    };

    print(jsonEncode(data));

    // final userPrefrence = Provider.of<UserProvider>(context, listen: false);

    // await _userServices.signinUser(model: signinModel).then((value) {
    //   if (value != null) {
    //     setLoading(false);

    //     storage.write(key: 'token', value: value.token);

    //     userPrefrence.saveUser(value);

    //     Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
    //     Navigator.pushReplacementNamed(context, RouteName.home);

    //     clearTextfield();
    //   } else {
    //     setLoading(false);
    //     return;
    //   }
    // });
  }
}
