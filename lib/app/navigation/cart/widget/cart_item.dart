import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        leading: SizedBox(
          width: 30.w,
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 300),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider),
              ),
            ),
            imageUrl: product.imageUrl,
          ),
        ),
        trailing: AddOrRemoveButton(icon: Icons.close, onTap: onPressed),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 145.w,
                  child: Text(
                    product.englishName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "${Constants.currencySymbol} ${product.salePrice}/${product.unit}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            Text(
              '$quantity x',
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.sp),
            ),
            Text(
              // "400",
              "${Constants.currencySymbol} ${product.salePrice * quantity}",
              style: TextStyle(
                color: Colors.green,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    });
  }
}
