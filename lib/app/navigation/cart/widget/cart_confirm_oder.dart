import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
import 'package:vegipak/app/utils/utils.dart';
import '../../../constants.dart';
import '../confirm_order.dart';

class CartConfirmOrdreWidget extends StatelessWidget {
  const CartConfirmOrdreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.1,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100), bottomRight: Radius.circular(0)),
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                            fontSize: 20,
                          ),
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
                          child: Consumer<CartProvider>(
                            builder: (context, value, _) {
                              return Text(
                                '${Constants.currencySymbol} ${value.subTotal}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.09),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Consumer<CartProvider>(builder: (context, value, _) {
              return Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {
                    if (value.totalProductCount > 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ConfirmOrder(),
                        ),
                      );
                    } else {
                      Utils.snackBarPopUp(
                          context, 'Not Item Add To cart', Colors.black);
                    }
                  },
                  child: const Text(
                    'Confirm Order',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
