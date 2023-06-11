import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/core/const.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
import 'package:vegipak/app/navigation/vegitable/provider/product_provider.dart';
import 'package:vegipak/app/navigation/vegitable/widget/custom_dialog_box.dart';
import 'package:vegipak/app/navigation/vegitable/widget/vegi_product_item.dart';
import '../../core/constants/my_colors.dart';

class AllVegitables extends StatelessWidget {
  const AllVegitables({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<ProductProvider>(
      builder: (context, value, _) {
        return Scaffold(
          body: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      topButton(
                        context: context,
                        btnText: '2x3',
                        btnIcon: Icons.grid_view_rounded,
                        backColor: value.gridView == 2
                            ? MyColors.kGreenColor
                            : MyColors.kGreyColor4,
                        color: value.gridView == 2
                            ? kWhitecolor
                            : MyColors.kGreyColor3,
                        onTap: () {
                          value.setGridView(2);
                        },
                      ),
                      const SizedBox(width: 12),
                      topButton(
                        context: context,
                        btnText: '3x4',
                        btnIcon: Icons.grid_on,
                        backColor: value.gridView == 3
                            ? MyColors.kGreenColor
                            : MyColors.kGreyColor4,
                        color: value.gridView == 3
                            ? kWhitecolor
                            : MyColors.kGreyColor3,
                        onTap: () {
                          value.setGridView(3);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: value.isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.w,
                          ),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: value.gridView,
                            mainAxisSpacing: 10.w,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: width / (height / 1.45),
                          ),
                          itemCount: value.productList.length,
                          itemBuilder: (context, index) {
                            // print(value.productList[index].id);

                            var product = value.productList[index];

                            return GestureDetector(
                              onTap: () async {
                                final provider = Provider.of<CartProvider>(
                                    context,
                                    listen: false);

                                provider.quantity = 1;
                                provider.tapField = false;
                                provider.qtyController.clear();
                                // int qunt = 0;
                                // var getItem = Checkout.instance.checkout
                                //     .firstWhereOrNull((element) {
                                //   return element['id'] == items[index].id;
                                // });
                                // if (getItem != null) {
                                //   // print(getItem);
                                //   qunt = getItem['qty'];
                                // }
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox(product: product);
                                  },
                                );

                                // if (qty != null) {
                                //   if (Checkout.instance.checkout.isEmpty && qty > 0) {
                                //     Checkout.instance.checkout
                                //         .add({"id": items[index].id, "qty": qty});
                                //   } else {
                                //     var searchResult = Checkout.instance.checkout
                                //         .firstWhereOrNull((element) {
                                //       return element['id'] == items[index].id;
                                //     });
                                //     if (searchResult == null && qty > 0) {
                                //       Checkout.instance.checkout
                                //           .add({"id": items[index].id, "qty": qty});
                                //     } else {
                                //       int index = Checkout.instance.checkout
                                //           .indexOf(searchResult);
                                //       if (qty == 0) {
                                //         Checkout.instance.checkout.removeAt(index);
                                //       } else {
                                //         Checkout.instance.checkout[index]['qty'] =
                                //             qty;
                                //       }
                                //     }
                                //   }
                                //   // print('QTY: $qunt');
                                //   // print('QTY1: $qty');
                                //   // widget.onCartChange(Checkout.instance.checkout.length);
                                // }
                              },
                              child: VegiProductCardItem(
                                product: product,
                                grid: value.gridView,
                              ),
                            );
                          }),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget topButton({
    required BuildContext context,
    required String btnText,
    required IconData btnIcon,
    required Color color,
    backColor,
    required Function()? onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: backColor,
        elevation: 6,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(btnIcon, color: color),
                const SizedBox(width: 8),
                Text(
                  btnText,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: color,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
