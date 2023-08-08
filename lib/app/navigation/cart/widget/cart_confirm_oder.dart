// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
// import 'package:vegipak/app/utils/utils.dart';
// import '../../../constants.dart';
// import '../confirm_order.dart';

// class CartConfirmOrdreWidget extends StatelessWidget {
//   const CartConfirmOrdreWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: MediaQuery.of(context).size.width * 0.1,
//       right: 0,
//       bottom: 0,
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(100), bottomRight: Radius.circular(0)),
//           color: Colors.green,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(1),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: const Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 const Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: Text(
//                           'Total :',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 16),
//                         child: Align(
//                           alignment: Alignment.topRight,
//                           child: Consumer<CartProvider>(
//                             builder: (context, value, _) {
//                               return Text(
//                                 '${Constants.currencySymbol} ${value.subTotal}',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize:
//                                         MediaQuery.of(context).size.width *
//                                             0.09),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Consumer<CartProvider>(builder: (context, value, _) {
//               return Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50)),
//                   ),
//                   onPressed: () {
//                     if (value.totalProductCount > 0) {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const ConfirmOrder(),
//                         ),
//                       );
//                     } else {
//                       Utils.snackBarPopUp(
//                           context, 'Not Item Add To cart', Colors.black);
//                     }
//                   },
//                   child: const Text(
//                     'Confirm Order',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';
import '../order_now.dart';
import '../provider/cart_provider.dart';

class CartOrderNow extends StatelessWidget {
  const CartOrderNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) {
        return value.cartList.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: Text(
                    'CART IS EMPTY',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1.0,
                        blurRadius: 10,
                        offset: Offset(0.h, 6.w),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[200]),
                          ),

                          const SizedBox(height: 8),
                          // total price
                          Text(
                            'Rs. ${value.subTotal}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (value.totalProductCount > 0) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderNow(),
                                //     ChangeNotifierProvider<CartProvider>.value(
                                //   value: context.read<CartProvider>(),
                                //   child: const OrderNow(),
                                // ),
                              ),
                            );
                          } else {
                            Utils.snackBarPopUp(
                                context, 'Not Item Add To cart', Colors.black);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
