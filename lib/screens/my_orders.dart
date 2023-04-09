// import 'package:flutter/material.dart';
// import 'package:vegipak/constants.dart';

// class MyOrders extends StatefulWidget {
//   const MyOrders({Key? key}) : super(key: key);

//   @override
//   State<MyOrders> createState() => _MyOrdersState();
// }

// class _MyOrdersState extends State<MyOrders> {
//   final _posts = [
//     {
//       'order_id': 'KHIB200001',
//       'placed_date': '11-02-2022',
//       'status': 'Pending',
//       'total_price': '100000',
//       'items': [
//         {"name": 'Potato', 'qty': 2, 'price': '100'},
//         {"name": 'carrot', 'qty': 2, 'price': '100'},
//       ],
//     },
//     {
//       'order_id': 'KHIB200001',
//       'placed_date': '11-02-2022',
//       'status': 'Completed',
//       'total_price': '100000',
//       'items': [
//         {"name": 'Potato', 'qty': 2, 'price': '100'},
//         {"name": 'carrot', 'qty': 2, 'price': '100'},
//       ],
//     },
//     {
//       'order_id': 'KHIB200001',
//       'placed_date': '11-02-2022',
//       'status': 'Canceled',
//       'total_price': '100000',
//       'items': [
//         {"name": 'Potato', 'qty': 2, 'price': '100'},
//         {"name": 'carrot', 'qty': 2, 'price': '100'},
//       ],
//     }
//   ];
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).textScaleFactor;
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: _posts.length,
//             itemBuilder: (_, index) => Card(
//               margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: _posts[index]['status'] == "Pending"
//                         ? Colors.green
//                         : Colors.white),
//                 child: ListTile(
//                     title: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 4),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           "Order# ",
//                                           style: TextStyle(
//                                               color: Colors.black54,
//                                               fontSize: width * 20,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           "${_posts[index]['order_id']}",
//                                           style: TextStyle(
//                                               color: _posts[index]['status'] ==
//                                                       "Pending"
//                                                   ? Colors.white
//                                                   : Colors.green,
//                                               fontSize: width * 20,
//                                               fontWeight: FontWeight.bold),
//                                         )
//                                       ],
//                                     )),
//                                 Expanded(
//                                     child: Center(
//                                         child: Text(
//                                   "${Constants.currencySymbol} ${_posts[index]['total_price']}",
//                                   style: TextStyle(
//                                       color:
//                                           _posts[index]['status'] == "Pending"
//                                               ? Colors.white
//                                               : Colors.green,
//                                       fontSize: width * 20,
//                                       fontWeight: FontWeight.bold),
//                                 )))
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: Text(
//                                 "Date : ${_posts[index]['placed_date']}",
//                                 style: const TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text(
//                                 "Status : ",
//                                 style: TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "${_posts[index]['status']}",
//                                 style: TextStyle(
//                                     color: _posts[index]['status'] == "Pending"
//                                         ? Colors.white
//                                         : _posts[index]['status'] == "Canceled"
//                                             ? Colors.red
//                                             : Colors.green,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     subtitle: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 1, color: Colors.black26),
//                         ),
//                         child: Column(
//                           children: [
//                             ...List.generate(
//                                 (_posts[index]['items'] as List).length, (i) {
//                               return Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Expanded(
//                                     child: Center(
//                                       child: Text(
//                                         "${(_posts[index]['items'] as List)[i]['name']}",
//                                         style: const TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Center(
//                                       child: Text(
//                                         "${Constants.currencySymbol} ${(_posts[index]['items'] as List)[i]['price']}",
//                                         style: const TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Center(
//                                       child: Text(
//                                         "x${(_posts[index]['items'] as List)[i]['qty']}",
//                                         style: const TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                   const Expanded(
//                                     child: Center(
//                                         child: Text(
//                                       "${Constants.currencySymbol} 400",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                   ),
//                                 ],
//                               );
//                             }),
//                           ],
//                         ),
//                       ),
//                     )),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
