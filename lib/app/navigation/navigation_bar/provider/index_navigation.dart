import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../cart/my_cart.dart';
// import '../../order/view/my_order.dart';
import '../../order/my_order.dart';
import '../../profile/profile.dart';
import '../../vegitable/all_vegitables.dart';
import '../../vegitable/provider/product_provider.dart';

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

  bool connectInternet = true;

  checkInternet() async {
    connectInternet = await InternetConnectionChecker().hasConnection;
    // log('connect $connectInternet');

    notifyListeners();
  }

  showInternetToast(BuildContext context) async {
    connectInternet = await InternetConnectionChecker().hasConnection;
    if (connectInternet) {
      Fluttertoast.showToast(msg: 'Internet Connected!');
      if (context.mounted) {
        Provider.of<ProductProvider>(context, listen: false)
            .getVegitableProduct(context);
      }
    } else {
      Fluttertoast.showToast(msg: 'Please check your internet');
    }
    notifyListeners();
  }
}
