import 'package:flutter/material.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';

import '../../../services/order_service.dart';

class OrderProv extends ChangeNotifier {
    OrderProv(context) {
    getMyOrders(context);
  }


  // final orders = [
  //   {
  //     'order_id': 'KHIB200001',
  //     'placed_date': '11-02-2022',
  //     'status': 'Pending',
  //     'total_price': '100000',
  //     'items': [
  //       {"name": 'Potato', 'qty': 2, 'price': '100'},
  //       {"name": 'carrot', 'qty': 2, 'price': '100'},
  //     ],
  //   },
  //   {
  //     'order_id': 'KHIB200001',
  //     'placed_date': '11-02-2022',
  //     'status': 'Completed',
  //     'total_price': '100000',
  //     'items': [
  //       {"name": 'Potato', 'qty': 2, 'price': '100'},
  //       {"name": 'carrot', 'qty': 2, 'price': '100'},
  //     ],
  //   },
  //   {
  //     'order_id': 'KHIB200001',
  //     'placed_date': '11-02-2022',
  //     'status': 'Canceled',
  //     'total_price': '100000',
  //     'items': [
  //       {"name": 'Potato', 'qty': 2, 'price': '100'},
  //       {"name": 'carrot', 'qty': 2, 'price': '100'},
  //     ],
  //   }
  // ];

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //-----------------------------------------------------*Get productList
  List<MyOrderModel> myOrdersList = [];
  OrderService order = OrderService();

  void getMyOrders(context) async {
    // log("message");
    setLoading(true);
    await order.getMyOrders(context).then((value) {
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
