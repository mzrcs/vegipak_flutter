import 'package:flutter/material.dart';
import '../../cart/view/my_cart.dart';
import '../../order/view/my_order.dart';
import '../../profile/view/my_profile.dart';
import '../../vegitable/view/all_vegitables.dart';

class NavigationIndex extends ChangeNotifier {
  int currentIndex = 0;
  List pages = [
    const AllVegitables(),
    const MyCart(),
    const MyOrder(),
    const MyProfile(),
  ];

  void bottomNav(int value) {
    notifyListeners();
    currentIndex = value;
    notifyListeners();
  }

  void toHomescreen() {
    currentIndex = 0;
    notifyListeners();
  }
}
