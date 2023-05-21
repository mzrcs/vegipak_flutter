import 'package:vegipak/models/item.dart';

class Cart {
  int totalAmount;
  int totalItems;
  List<Item> items;
  Cart(this.totalAmount, this.totalItems, this.items);
}
