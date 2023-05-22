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
        return value.cartList.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: Text(
                    'CART IS EMPTY',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 1,
                      fontFamily: 'Teko-Medium',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.green,
                  thickness: 1,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
              );
      },
    );
  }
}
