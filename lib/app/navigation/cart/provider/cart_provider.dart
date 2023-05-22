import 'package:flutter/material.dart';
import 'package:vegipak/app/model/cart/cart_model.dart';
import 'package:vegipak/app/utils/utils.dart';

class CartProvider extends ChangeNotifier {
  int quantity = 1;

  List<CartModel> cartList = [];

  int get totalProductCount => cartList.length;

  void increaseQty() {
    quantity++;
    notifyListeners();
  }

  void decreaseQty() {
    if (quantity > 1) {
      quantity--;
    }
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
}
