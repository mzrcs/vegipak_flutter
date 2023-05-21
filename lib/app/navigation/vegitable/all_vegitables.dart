import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/core/const.dart';
import 'package:vegipak/app/navigation/vegitable/provider/product_provider.dart';
import 'package:vegipak/app/navigation/vegitable/widget/vegi_product_item.dart';
import '../../utils/constants.dart';

class AllVegitables extends StatelessWidget {
  const AllVegitables({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, _) {
        return Scaffold(
          body: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      topButton(
                        context: context,
                        btnText: '2x3',
                        btnIcon: Icons.grid_view_rounded,
                        backColor:
                            value.gridView == 2 ? kGreenColor : kGreyColor4,
                        color: value.gridView == 2 ? kWhitecolor : kGreyColor3,
                        onTap: () {
                          value.setGridView(2);
                        },
                      ),
                      const SizedBox(width: 12),
                      topButton(
                        context: context,
                        btnText: '3x4',
                        btnIcon: Icons.grid_on,
                        backColor:
                            value.gridView == 3 ? kGreenColor : kGreyColor4,
                        color: value.gridView == 3 ? kWhitecolor : kGreyColor3,
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
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: double.maxFinite,
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: value.gridView,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 12,
                                childAspectRatio: 0.82,
                              ),
                              itemCount: value.productList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    // int qunt = 0;
                                    // var getItem = Checkout.instance.checkout
                                    //     .firstWhereOrNull((element) {
                                    //   return element['id'] == items[index].id;
                                    // });
                                    // if (getItem != null) {
                                    //   // print(getItem);
                                    //   qunt = getItem['qty'];
                                    // }
                                    // var qty = await showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) {
                                    //     return CustomDialogBox(
                                    //       id: value.items[index].id,
                                    //       title: value.items[index].productName,
                                    //       price: value.items[index].price,
                                    //       image: value.items[index].image,
                                    //       unit: value.items[index].unit,
                                    //       qty: 0,
                                    //     );
                                    //   },
                                    // );

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
                                      product: value.productList[index]),
                                );
                              }),
                        ),
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
