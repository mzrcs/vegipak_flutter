import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
import 'package:vegipak/app/navigation/cart/widget/cart_item.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) {
        var cartItems = value.cartList;
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.green,
              thickness: 0.5,
            ),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              var cartItem = cartItems[index];

              return CartItem(
                product: cartItem.product,
                quantity: cartItem.quantity,
                onPressed: () {
                  value.removeToCart(cartItem, context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
