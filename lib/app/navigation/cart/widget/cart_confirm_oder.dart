import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../view/confirm_order.dart';

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
                            '${Constants.currencySymbol} 0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.1),
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
                  // if (userCart.totalItems > 0) {
                  // await showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return const CheckoutDialog();
                  //     });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ConfirmOrder(),
                    ),
                  );
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
    );
  }
}
