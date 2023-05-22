import 'package:flutter/material.dart';
import 'package:vegipak/app/navigation/cart/widget/cart_list.dart';
import 'widget/cart_confirm_oder.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('CART', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    CartListWidget(),
                  ],
                ),
              ),
            ),
            const CartConfirmOrdreWidget(),
          ],
        ),
      ),
    );
  }
}