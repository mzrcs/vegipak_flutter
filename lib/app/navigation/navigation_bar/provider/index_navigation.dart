import 'package:flutter/material.dart';
import '../../cart/my_cart.dart';
// import '../../order/view/my_order.dart';
import '../../order/view/my_order.dart';
import '../../profile/profile.dart';
import '../../vegitable/all_vegitables.dart';

class NavigationIndex extends ChangeNotifier {
  int currentIndex = 0;
  List pages = [
    const AllVegitables(),
    const MyCart(),
    // const MyCart(),
    const MyOrder(),
    const Profile(),
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
