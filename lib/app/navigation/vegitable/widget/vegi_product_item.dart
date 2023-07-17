import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegipak/app/core/constants/my_colors.dart';
import 'package:vegipak/app/model/product/product_model.dart';

class VegiProductCardItem extends StatelessWidget {
  final int grid;
  final ProductModel product;
  const VegiProductCardItem({
    super.key,
    required this.product,
    required this.grid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1.0,
            blurRadius: 10,
            offset: Offset(0.h, 6.w),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: grid == 3 ? 100.h : 165.h,
            decoration: BoxDecoration(
              color: MyColors.kGreenColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: grid == 3 ? 35.r : 50.r,
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Hero(
                    tag: product,
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 300),
                      placeholder: (context, url) => CircleAvatar(
                        radius: grid == 3 ? 35.r : 50.r,
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider),
                        ),
                      ),
                      imageUrl: product.imageUrl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.w,
              top: grid == 3 ? 6.w : 10.w,
              right: 6.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: grid == 3 ? 35.h : 48.h,
                  child: Text(
                    '${product.englishName} / ${product.urduName}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: grid == 3 ? 12.sp : 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: grid == 3 ? 5.h : 7.h),
                Text(
                  "Rs. ${product.regularPrice}/${product.unit}",
                  style: TextStyle(
                    fontSize: grid == 3 ? 11.sp : 13.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
