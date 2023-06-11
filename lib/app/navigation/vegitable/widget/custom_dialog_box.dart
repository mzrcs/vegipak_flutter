import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/core/constants/my_colors.dart';
import 'package:vegipak/app/model/product/product_model.dart';
import 'package:vegipak/app/constants.dart';
import '../../../model/cart/cart_model.dart';
import '../../cart/provider/cart_provider.dart';
import 'add_or_remove_button.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);

    return Consumer<CartProvider>(
      builder: (context, value, _) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.padding),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 85.w,
                    right: 20.w,
                    bottom: 20.w,
                  ),
                  margin: EdgeInsets.only(top: 80.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Constants.padding),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 10),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '${product.englishName} / ${product.urduName}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        "Rs : ${product.salePrice} / ${product.unit}",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 22.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AddOrRemoveButton(
                            icon: Icons.remove,
                            onTap: () {
                              provider.decreaseQty();
                            },
                          ),
                          if (value.tapField)
                            SizedBox(
                              width: 45.w,
                              height: 40.h,
                              child: TextFormField(
                                autofocus: true,
                                controller: value.qtyController,
                                showCursor: false,
                                cursorColor: Colors.transparent,
                                cursorWidth: 0.0,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                onChanged: (qtyValue) {
                                  // print('init val $qtyValue');
                                  if (qtyValue.isNotEmpty) {
                                    value.updateQtyValue(qtyValue);
                                  } else {
                                    value.updateQtyValue('1');
                                  }
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyColors.kGreenColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyColors.kGreenColor,
                                    ),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ),
                          if (!value.tapField)
                            SizedBox(
                              width: 45.w,
                              height: 40.h,
                              child: InkWell(
                                onTap: () {
                                  value.tap();
                                },
                                child: AnimatedFlipCounter(
                                  value: value.quantity,
                                  duration: const Duration(milliseconds: 500),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  curve: Curves.fastOutSlowIn,
                                  textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          AddOrRemoveButton(
                            icon: Icons.add,
                            onTap: () {
                              provider.increaseQty();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80.r,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Constants.avatarRadius),
                    ),
                    child: Hero(
                      tag: product,
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
                  ),
                ),
              ),
              Positioned(
                left: 85.w,
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    // print(value.quantity);
                    var cartItem = CartModel(
                      quantity: value.quantity,
                      product: product,
                    );
                    value.addToCart(cartItem, context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                      color: MyColors.kGreenColor,
                    ),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// class CustomDialogBox2 extends StatefulWidget {
//   final int id, qty;
//   final String title, price, image, unit;

//   const CustomDialogBox2({
//     Key? key,
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.image,
//     required this.unit,
//     required this.qty,
//   }) : super(key: key);

//   @override
//   State<CustomDialogBox2> createState() => _CustomDialogBox2State();
// }

// class _CustomDialogBox2State extends State<CustomDialogBox2> {
//   int counter = 0;
//   late TextEditingController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(Constants.padding),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: contentBox(context),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     counter = widget.qty;
//     _controller = TextEditingController(text: widget.qty.toString());
//   }

//   contentBox(context) {
//     return Stack(
//       children: <Widget>[
//         SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.only(
//               left: Constants.padding,
//               top: Constants.avatarRadius,
//               right: Constants.padding,
//               bottom: Constants.padding,
//             ),
//             margin: const EdgeInsets.only(top: Constants.avatarRadius),
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(Constants.padding),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black45,
//                   offset: Offset(0, 10),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   widget.title,
//                   style: const TextStyle(
//                       fontSize: 25, fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   "Price : ${widget.price}/${widget.unit}",
//                   style: const TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 22),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           if (counter > 0) {
//                             setState(() {
//                               counter--;
//                               _controller = TextEditingController(
//                                 text: counter.toString(),
//                               );
//                             });
//                           }
//                         });
//                       },
//                       child: const Icon(Icons.remove),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: TextFormField(
//                         style:
//                             const TextStyle(fontSize: 20, color: Colors.green),
//                         controller: _controller,
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             // print(value);
//                             setState(() {
//                               counter = int.parse(value);
//                             });
//                             // print('counter: ' + counter.toString());
//                           }
//                         },
//                         textAlign: TextAlign.right,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                           contentPadding: EdgeInsets.only(
//                             left: 15,
//                             bottom: 11,
//                             top: 0,
//                             right: 15,
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (counter < 10) {
//                           setState(() {
//                             counter++;
//                             _controller = TextEditingController(
//                               text: counter.toString(),
//                             );
//                           });
//                         }
//                       },
//                       child: const Icon(Icons.add),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 70),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           top: 0,
//           child: CircleAvatar(
//             backgroundColor: Colors.transparent,
//             radius: Constants.avatarRadius,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.all(
//                   Radius.circular(Constants.avatarRadius)),
//               child: Image.asset(widget.image),
//             ),
//           ),
//         ),
//         Positioned(
//           left: 70,
//           right: 0,
//           bottom: 0,
//           child: GestureDetector(
//             onTap: () {
//               return Navigator.pop(context, counter);
//             },
//             child: Container(
//               alignment: Alignment.center,
//               height: 50,
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(100),
//                       bottomRight: Radius.circular(10)),
//                   color: Colors.green),
//               child: const Text(
//                 'Add to cart',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
