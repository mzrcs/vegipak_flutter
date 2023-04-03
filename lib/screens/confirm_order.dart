import 'package:flutter/material.dart';
import 'package:vegipak/constants.dart';
import 'package:vegipak/mixins/checkout_validations.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> with CheckoutValidations {
  final formGlobalKey = GlobalKey<FormState>();
  String dropdownvalue = 'Block 1';
  var items = [
    'Block 1',
    'Block 2',
    'Block 3',
    'Block 4',
    'Block 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Text(
          'Go Back',
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.green,
          size: 20,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.green,
        child: Center(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: const EdgeInsets.only(
                      left: Constants.padding,
                      top: 10,
                      right: Constants.padding,
                      bottom: Constants.padding),
                  margin: const EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Constants.padding),
                      boxShadow: const [
                        // BoxShadow(
                        //     color: Colors.black45,
                        //     offset: Offset(0, 10),
                        //     blurRadius: 10),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formGlobalKey,
                        child: Column(
                          children: [
                            const Text(
                              "Confirm Order",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Full Name',
                                errorText: null,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              validator: (fullName) {
                                if (isFullNameValid(fullName ?? '')) {
                                  return null;
                                } else {
                                  return 'Enter a valid name';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                errorText: null,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              validator: (email) {
                                if (isEmailValid(email ?? '')) {
                                  return null;
                                } else {
                                  return 'Enter a valid email address';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Mobile Number',
                                errorText: null,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              validator: (mobileNumber) {
                                if (isMobileNumberValid(mobileNumber ?? '')) {
                                  return null;
                                } else {
                                  return 'Enter valid number e.g. 03xxxxxxxxx';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                labelText: 'Gulistan-e-Johuar',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              isExpanded: true,
                              iconEnabledColor: Colors.green,
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              maxLines: 2,
                              decoration: const InputDecoration(
                                labelText: 'Address',
                                errorText: null,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              validator: (address) {
                                if (isAddressValid(address ?? '')) {
                                  return null;
                                } else {
                                  return 'Enter valid address';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              maxLines: 2,
                              decoration: const InputDecoration(
                                labelText: 'Special Note',
                                errorText: null,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.4,
                right: 0,
                bottom: -2,
                child: GestureDetector(
                  onTap: () {
                    if (formGlobalKey.currentState!.validate()) {
                      // print('good');
                    }
                    // print('bad');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(10)),
                        color: Colors.green),
                    child: const Text(
                      'Order Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
