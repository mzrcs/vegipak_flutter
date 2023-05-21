import 'package:flutter/material.dart';
import 'package:vegipak/app/model/product/product_model.dart';
import '../../../utils/constants.dart';

class VegiProductCardItem extends StatelessWidget {
  final ProductModel product;
  const VegiProductCardItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: kGreenColorTint,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: kGreenColorTint2.withOpacity(0.6),
                    ),
                  ),
                  Image.network(
                    product.imageUrl,
                    height: 160,
                  )
                ],
              ),
            ),
          ),
        ),
        Text(
          '${product.englishName} / ${product.urduName}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "Rs. ${product.regularPrice}/${product.unit}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
