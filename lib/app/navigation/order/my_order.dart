import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/order/provider/order_prov.dart';
import 'package:vegipak/app/navigation/order/widget/my_orders_list.dart';
import '../../custom/annotated_widget.dart';
import '../navigation_bar/provider/index_navigation.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  void initState() {
    super.initState();
    Provider.of<NavigationIndex>(context, listen: false).checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    final value = context.watch<OrderProvider>();

    // log('currentDate ${value.currentFormattedDate}');
    // log('lastWeekDate ${value.lastWeekFormattedDate}');

    return AnnotatedWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From: ${value.currentFormattedDate}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        "To: ${value.lastWeekFormattedDate}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                const MyOrderList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
