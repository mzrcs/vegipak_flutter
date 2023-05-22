import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/product/product_model.dart';
import '../../vegitable/widget/add_or_remove_button.dart';
import '../provider/cart_provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.onPressed,
  });

  final int quantity;
  final ProductModel product;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, _) {
      return ListTile(
        leading: Image.network(product.imageUrl),
        trailing: AddOrRemoveButton(icon: Icons.close, onTap: onPressed),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  product.englishName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "${Constants.currencySymbol} ${product.salePrice}/${product.unit}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            Text(
              '$quantity x',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              // "400",
              "${Constants.currencySymbol} ${product.salePrice * quantity}",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    });
  }
}
