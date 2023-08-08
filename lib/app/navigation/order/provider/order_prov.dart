import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';

import '../../../services/order_service.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider(context) {
    updateDateInfo();
    getMyOrders(context);
  }

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<MyOrderModel> myOrdersList = [];
  OrderService order = OrderService();

  String currentFormattedDate = "";
  String lastWeekFormattedDate = "";

  void updateDateInfo() {
    DateTime now = DateTime.now();
    DateTime lastWeek = now.subtract(const Duration(days: 7));

    String formattedNow = DateFormat('yyyy-MM-dd').format(now);
    String formattedLastWeek = DateFormat('yyyy-MM-dd').format(lastWeek);

    currentFormattedDate = formattedNow;
    lastWeekFormattedDate = formattedLastWeek;

    notifyListeners();
  }

  void getMyOrders(context) async {
    // log("message");
    setLoading(true);
    await order
        .getMyOrders(
      context: context,
      currentDate: currentFormattedDate,
      lastWeekDate: lastWeekFormattedDate,
    )
        .then((value) {
      if (value != null) {
        // log("message");
        myOrdersList = value;
        notifyListeners();

        setLoading(false);
      } else {
        setLoading(false);
        return null;
      }
    });
  }
}
