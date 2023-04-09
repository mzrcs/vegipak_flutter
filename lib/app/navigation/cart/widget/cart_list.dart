import 'package:flutter/material.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userCart = [];
    return userCart.isEmpty
        ? const SizedBox(
            child: Center(
              child: Text('Cart is Empty'),
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.green,
              thickness: 1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: userCart.length,
            itemBuilder: (context, index) {
              // var cartItems = Checkout.instance.checkout;
              // var item = userCart.items[index];
              return ListTile(
                leading: Image.asset(''),
                trailing: IconButton(
                    onPressed: () {
                      // setState(() {
                      //   Checkout.instance.removeItem(index);
                      //   userCart = Checkout.instance.getUserCart(items);
                      //   widget.onCartChange(Checkout.instance.checkout.length);
                      // });
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
                          'item.productName',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "\$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Text(
                      'x',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      "",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          );
  }
}
