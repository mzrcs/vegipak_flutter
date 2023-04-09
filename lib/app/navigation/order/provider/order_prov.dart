import 'package:flutter/material.dart';

class OrderProv extends ChangeNotifier {
  final orders = [
    {
      'order_id': 'KHIB200001',
      'placed_date': '11-02-2022',
      'status': 'Pending',
      'total_price': '100000',
      'items': [
        {"name": 'Potato', 'qty': 2, 'price': '100'},
        {"name": 'carrot', 'qty': 2, 'price': '100'},
      ],
    },
    {
      'order_id': 'KHIB200001',
      'placed_date': '11-02-2022',
      'status': 'Completed',
      'total_price': '100000',
      'items': [
        {"name": 'Potato', 'qty': 2, 'price': '100'},
        {"name": 'carrot', 'qty': 2, 'price': '100'},
      ],
    },
    {
      'order_id': 'KHIB200001',
      'placed_date': '11-02-2022',
      'status': 'Canceled',
      'total_price': '100000',
      'items': [
        {"name": 'Potato', 'qty': 2, 'price': '100'},
        {"name": 'carrot', 'qty': 2, 'price': '100'},
      ],
    }
  ];
}
