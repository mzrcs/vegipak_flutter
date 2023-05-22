import 'package:flutter/material.dart';
import 'package:vegipak/app/constants.dart';
import 'package:vegipak/models/item.dart';
import 'package:vegipak/models/cart.dart';
import 'package:vegipak/screens/confirm_order.dart';
import 'package:vegipak/singleton.dart/checkout.dart';

class MyCartScreen extends StatefulWidget {
  final Function onCartChange;
  const MyCartScreen({Key? key, required this.onCartChange}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

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

class _MyCartScreenState extends State<MyCartScreen> {
  Cart userCart = Checkout.instance.getUserCart(items);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Stack(
        children: [
          userCart.totalItems < 1
              ? const Center(
                  child: Text("No items found."),
                )
              : SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.green,
                          thickness: 1,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: userCart.totalItems,
                        itemBuilder: (context, index) {
                          var cartItems = Checkout.instance.checkout;
                          var item = userCart.items[index];
                          return ListTile(
                            leading: Image.asset(item.image),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    Checkout.instance.removeItem(index);
                                    userCart =
                                        Checkout.instance.getUserCart(items);
                                    widget.onCartChange(
                                        Checkout.instance.checkout.length);
                                  });
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                )),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      item.productName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "${Constants.currencySymbol} ${item.price}/${item.unit}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                                Text(
                                  '${cartItems[index]['qty']}x',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  "${Constants.currencySymbol} ${int.parse(item.price) * cartItems[index]['qty']}",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 130,
                      )
                    ],
                  ),
                ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.1,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: Radius.circular(0)),
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: const [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Total :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '${Constants.currencySymbol} ${userCart.totalAmount}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () async {
                        if (userCart.totalItems > 0) {
                          // await showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return const CheckoutDialog();
                          //     });
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const ConfirmOrder()));
                        }
                      },
                      child: const Text(
                        'Confirm Order',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
