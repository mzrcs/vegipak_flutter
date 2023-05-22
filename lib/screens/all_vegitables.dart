import 'package:flutter/material.dart';
import 'package:vegipak/app/constants.dart';
import 'package:vegipak/app/navigation/vegitable/widget/custom_dialog_box.dart';
import 'package:vegipak/models/item.dart';
import 'package:collection/collection.dart';
import 'package:vegipak/singleton.dart/checkout.dart';

class AllVegitables extends StatefulWidget {
  final Function onCartChange;
  const AllVegitables({Key? key, required this.onCartChange}) : super(key: key);

  @override
  State<AllVegitables> createState() => _AllVegitablesState();
}

class _AllVegitablesState extends State<AllVegitables> {
  int gridView = 2;
  var items = [
    Item(0, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(1, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(2, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(3, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(4, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(5, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(6, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(7, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(8, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(9, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(10, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(11, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(12, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(13, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(14, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(15, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    Item(16, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(17, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    Item(18, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
  ];

  @override
  Widget build(BuildContext context) {
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
                  primary: gridView == 2 ? Colors.green : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    gridView = 2;
                  });
                },
                icon: const Icon(Icons.grid_view_rounded),
                label: const Text('2x3'),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: gridView == 3 ? Colors.green : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    gridView = 3;
                  });
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
                  crossAxisCount: gridView,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.83,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      int qunt = 0;
                      var getItem = Checkout.instance.checkout
                          .firstWhereOrNull((element) {
                        return element['id'] == items[index].id;
                      });
                      if (getItem != null) {
                        // print(getItem);
                        qunt = getItem['qty'];
                      }
                      var qty = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox2(
                            id: items[index].id,
                            title: items[index].productName,
                            price: items[index].price,
                            image: items[index].image,
                            unit: items[index].unit,
                            qty: qunt,
                          );
                        },
                      );

                      if (qty != null) {
                        if (Checkout.instance.checkout.isEmpty && qty > 0) {
                          Checkout.instance.checkout
                              .add({"id": items[index].id, "qty": qty});
                        } else {
                          var searchResult = Checkout.instance.checkout
                              .firstWhereOrNull((element) {
                            return element['id'] == items[index].id;
                          });
                          if (searchResult == null && qty > 0) {
                            Checkout.instance.checkout
                                .add({"id": items[index].id, "qty": qty});
                          } else {
                            int index = Checkout.instance.checkout
                                .indexOf(searchResult);
                            if (qty == 0) {
                              Checkout.instance.checkout.removeAt(index);
                            } else {
                              Checkout.instance.checkout[index]['qty'] = qty;
                            }
                          }
                        }
                        // print('QTY: $qunt');
                        // print('QTY1: $qty');
                        // widget.onCartChange(Checkout.instance.checkout.length);
                      }
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
                                    items[index].image,
                                    height: 160,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          items[index].productName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${Constants.currencySymbol} ${items[index].price}/${items[index].unit}",
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
  }
}

// showAlertDialog(BuildContext context, Item item) {
//   // set up the button
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () {},
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     // title: Text(item.productName),
//     content: Positioned(
//       left: 20,
//       right: 20,
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 45,
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(45)),
//           child: Image.asset(item.image),
//         ),
//       ),
//     ),

//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
