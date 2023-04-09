import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/vegitable/provider/vegitable_prov.dart';
import '../../../../constants.dart';
import '../widget/custom_dialog_box.dart';

class AllVegitables extends StatelessWidget {
  const AllVegitables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VegitableProv>(
        builder: (context, value, child) {
          return Column(
            children: [
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            value.gridView == 2 ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        value.setGridView(2);
                        // setState(() {
                        //   gridView = 2;
                        // });
                      },
                      icon: const Icon(Icons.grid_view_rounded),
                      label: const Text('2x3'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            value.gridView == 3 ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        value.setGridView(3);

                        // setState(() {
                        //   gridView = 3;
                        // });
                      },
                      icon: const Icon(Icons.grid_on),
                      label: const Text('3x4'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: value.gridView,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.83,
                      ),
                      itemCount: value.items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // int qunt = 0;
                            // var getItem = Checkout.instance.checkout
                            //     .firstWhereOrNull((element) {
                            //   return element['id'] == items[index].id;
                            // });
                            // if (getItem != null) {
                            //   // print(getItem);
                            //   qunt = getItem['qty'];
                            // }
                            var qty = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  id: value.items[index].id,
                                  title: value.items[index].productName,
                                  price: value.items[index].price,
                                  image: value.items[index].image,
                                  unit: value.items[index].unit,
                                  qty: 0,
                                );
                              },
                            );

                            // if (qty != null) {
                            //   if (Checkout.instance.checkout.isEmpty && qty > 0) {
                            //     Checkout.instance.checkout
                            //         .add({"id": items[index].id, "qty": qty});
                            //   } else {
                            //     var searchResult = Checkout.instance.checkout
                            //         .firstWhereOrNull((element) {
                            //       return element['id'] == items[index].id;
                            //     });
                            //     if (searchResult == null && qty > 0) {
                            //       Checkout.instance.checkout
                            //           .add({"id": items[index].id, "qty": qty});
                            //     } else {
                            //       int index = Checkout.instance.checkout
                            //           .indexOf(searchResult);
                            //       if (qty == 0) {
                            //         Checkout.instance.checkout.removeAt(index);
                            //       } else {
                            //         Checkout.instance.checkout[index]['qty'] =
                            //             qty;
                            //       }
                            //     }
                            //   }
                            //   // print('QTY: $qunt');
                            //   // print('QTY1: $qty');
                            //   // widget.onCartChange(Checkout.instance.checkout.length);
                            // }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(14.0),
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor:
                                                Colors.green.withOpacity(0.5),
                                          ),
                                        ),
                                        Image.asset(
                                          value.items[index].image,
                                          height: 160,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                value.items[index].productName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${Constants.currencySymbol} ${value.items[index].price}/${value.items[index].unit}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
