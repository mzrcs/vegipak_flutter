import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/order_prov.dart';

class MyOrderList extends StatelessWidget {
  const MyOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, value, _) {
        return value.isLoading
            ? const Center(child: CircularProgressIndicator())
            : value.myOrdersList.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: const Text(
                        'NO ORDER FOUND',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: value.myOrdersList.length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 8,
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 16.0,
                          ),
                          child: Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 17,
                              //   backgroundColor: MyColors.kGreenColor,
                              //   child: Center(
                              //     child: Text(
                              //       user.fullName != null ? user.fullName![0] : '',
                              //       style: const TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order #${value.myOrdersList[index].id}",
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            value.myOrdersList[index].status
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    const Divider(),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                            // growable: false,
                                            value.myOrdersList[index].cartItems!
                                                .length,
                                            (i) {
                                              var cart = value
                                                  .myOrdersList[index]
                                                  .cartItems![i];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 28.w,
                                                      child: Image.network(cart
                                                          .product.imageUrl),
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    SizedBox(
                                                      width: 150.w,
                                                      child: Text(
                                                        cart.product
                                                            .englishName,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        softWrap: false,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 13.sp,
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    Text(
                                                      'x ${cart.quantity}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 12.5.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 4.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'TOTAL',
                                                // textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 12.sp,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Text(
                                                'Rs. ${value.myOrdersList[index].total}',
                                                // textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }
}
