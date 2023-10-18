import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';

import '../../components/no_internet_widget.dart';
import '../../utils/utils.dart';
import '../../components/textfield_widget.dart';

class OrderNow extends StatefulWidget {
  const OrderNow({super.key});

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CartProvider>(context, listen: false).getSavedData(context);
      Provider.of<CartProvider>(context, listen: false).getDistrictArea();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Order Now',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, _) {
          if (value.isError) {
            return const NoInternet(isServerError: true);
          } else {
            return value.isLoadingData
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        child: Form(
                          key: value.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fill out detail",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 12.h),

                              textFieldWidget1(
                                context: context,
                                hintText: 'Phone',
                                iconData: Icons.phone,
                                controller: value.phoneController,
                                textInputType: TextInputType.number,
                                validator: value
                                    .textFieldValidator.validatePhoneNumber,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(11),
                                ],
                              ),

                              SizedBox(height: 12.h),

                              // !: Address field
                              // textFieldWidget2(
                              //   context: context,
                              //   hintText: 'Address',
                              //   controller: value.addressController,
                              //   validator:
                              //       value.textFieldValidator.addressErrorGetter,
                              // ),

                              textFieldWidget1(
                                context: context,
                                hintText: 'Address',
                                iconData: Icons.home,
                                controller: value.addressController,
                                validator:
                                    value.textFieldValidator.validateAddress,
                              ),

                              SizedBox(height: 12.h),

                              Consumer<CartProvider>(
                                builder: (context, provider, _) {
                                  log('area Id ${provider.selectedAreaId}');
                                  return Utils().customDropdownButton(
                                    value: provider.selectedAreaId.toString(),
                                    context: context,
                                    hintText: 'Select Area',
                                    errorText: 'Please select area',
                                    iconData: Icons.location_city,
                                    items: provider.districtAreaList
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item.id.toString(),
                                            child: Text(
                                              item.name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87,
                                                    fontSize: 17,
                                                  ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      provider.selectAreaId(
                                          int.parse(value.toString()));
                                    },
                                  );
                                },
                              ),

                              SizedBox(height: 12.h),

                              // !: Note field
                              // textFieldWidget2(
                              //   context: context,
                              //   hintText: 'Extra Note',
                              //   controller: value.noteController,
                              //   validator:
                              //       value.textFieldValidator.noteErrorGetter,
                              // ),

                              textFieldWidget1(
                                context: context,
                                maxLines: 3,
                                hintText: 'Extra Note',
                                iconData: Icons.note_alt,
                                textInputType: TextInputType.multiline,
                                controller: value.noteController,
                                validator:
                                    value.textFieldValidator.validateNote,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (value.isLoading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  );
          }
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, value, _) {
          if (value.isError) {
            return const SizedBox();
          } else {
            return Padding(
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
                        Provider.of<CartProvider>(context, listen: false)
                            .orderNow(context);
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
                              'Confirm Order',
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
          }
        },
      ),
    );
  }
}
