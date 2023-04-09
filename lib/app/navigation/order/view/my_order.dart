import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../provider/order_prov.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Consumer<OrderProv>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.orders.length,
                  itemBuilder: (_, index) => Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: value.orders[index]['status'] == "Pending"
                              ? Colors.green
                              : Colors.white),
                      child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Order# ",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: width * 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${value.orders[index]['order_id']}",
                                                style: TextStyle(
                                                    color: value.orders[index]
                                                                ['status'] ==
                                                            "Pending"
                                                        ? Colors.white
                                                        : Colors.green,
                                                    fontSize: width * 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          child: Center(
                                              child: Text(
                                        "${Constants.currencySymbol} ${value.orders[index]['total_price']}",
                                        style: TextStyle(
                                            color: value.orders[index]
                                                        ['status'] ==
                                                    "Pending"
                                                ? Colors.white
                                                : Colors.green,
                                            fontSize: width * 20,
                                            fontWeight: FontWeight.bold),
                                      )))
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Date : ${value.orders[index]['placed_date']}",
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Status : ",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${value.orders[index]['status']}",
                                      style: TextStyle(
                                          color: value.orders[index]
                                                      ['status'] ==
                                                  "Pending"
                                              ? Colors.white
                                              : value.orders[index]['status'] ==
                                                      "Canceled"
                                                  ? Colors.red
                                                  : Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black26),
                              ),
                              child: Column(
                                children: [
                                  ...List.generate(
                                      (value.orders[index]['items'] as List)
                                          .length, (i) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "${(value.orders[index]['items'] as List)[i]['name']}",
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "${Constants.currencySymbol} ${(value.orders[index]['items'] as List)[i]['price']}",
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "x${(value.orders[index]['items'] as List)[i]['qty']}",
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: Center(
                                              child: Text(
                                            "${Constants.currencySymbol} 400",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
