import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
import 'package:vegipak/app/navigation/cart/widget/cart_confirm_oder.dart';
import 'package:vegipak/app/navigation/cart/widget/cart_list.dart';
// import 'widget/cart_confirm_oder.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "My Cart",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CartListWidget(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CartOrderNow(),
      ),
    );
  }
}
