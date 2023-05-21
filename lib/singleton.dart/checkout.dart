import 'package:vegipak/models/item.dart';
import 'package:vegipak/models/cart.dart';

class Checkout {
  var checkout = [];
  int getTotalItems() {
    return checkout.length;
  }

  void removeItem(int index) {
    checkout.removeAt(index);
  }

  Cart getUserCart(List items) {
    List<Item> cart = [];
    int totalAmount = 0;
    for (var element in checkout) {
      var item = items.firstWhere((el) => el.id == element['id']);
      totalAmount +=
          int.parse(item.price) * int.parse(element['qty'].toString());
      cart.add(item);
    }
    return Cart(totalAmount, checkout.length, cart);
  }

  static Checkout? _instance;

  Checkout._();

  static Checkout get instance => _instance ??= Checkout._();
}
