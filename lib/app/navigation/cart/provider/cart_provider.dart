import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/model/cart/cart_model.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';
import 'package:vegipak/app/model/user/area_model.dart';
import 'package:vegipak/app/utils/utils.dart';
import '../../../auth/provider/user_provider.dart';
import '../../../model/user/user_model.dart';
import '../../../services/order_service.dart';
import '../../../utils/routes/routes_name.dart';

class CartProvider extends ChangeNotifier {
  CartProvider(context) {
    getDistrictArea();
    getSavedData(context);
  }

  bool tapField = false;
  int quantity = 1;
  TextEditingController qtyController = TextEditingController();

  void tap() {
    tapField = !tapField;
    qtyController.text = quantity.toString();
    notifyListeners();
  }

  List<CartModel> cartList = [];
  CartModel? cartModel;

  int get totalProductCount => cartList.length;

  void increaseQty() {
    quantity++;
    qtyController.text = quantity.toString();
    notifyListeners();
  }

  void decreaseQty() {
    if (quantity > 1) {
      quantity--;
      qtyController.text = quantity.toString();
    }
    notifyListeners();
  }

  void updateQtyValue(String value) {
    quantity = int.parse(value);
    notifyListeners();
  }

  void addToCart(CartModel cartItem, BuildContext context) {
    if (quantity > 0) {
      cartList.add(cartItem);
      Utils.snackBarPopUp(context, "Added To Cart Successfully", Colors.green);
    }
    notifyListeners();
    quantity = 1;
  }

  void removeToCart(CartModel cartItem, BuildContext context) {
    cartList.remove(cartItem);
    Utils.snackBarPopUp(context, "Removed From Cart Successfully", Colors.red);
    notifyListeners();
  }

  double get subTotal {
    double subTotal = 0;
    for (int i = 0; i < cartList.length; i++) {
      subTotal += cartList[i].product.salePrice * cartList[i].quantity;
    }
    return double.parse(subTotal.toStringAsFixed(4));
  }

  final OrderService _orderServices = OrderService();
  List<DistrictAreas> districtAreaList = [];

  int? selectedAreaId;
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  selectAreaId(int value) {
    selectedAreaId = value;
    notifyListeners();
  }

  UserModel userModel = UserModel();

  Future<void> getSavedData(context) async {
    setLoading(true);
    final userPrefrence = Provider.of<UserProvider>(context, listen: false);
    await userPrefrence.getSaveUser(userModel);
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      phoneController.text = userModel.phone;
      addressController.text = userModel.address;
      selectedAreaId = userModel.districtAreaId;
      setLoading(false);
    });

    log('area Id ${userModel.districtAreaId}');
  }

  Future getDistrictArea() async {
    // log("message");
    setLoading(true);
    await _orderServices.districtAreas().then((value) {
      if (value != null) {
        // print(value.districtAreas);
        districtAreaList = value.districtAreas!;
        notifyListeners();

        setLoading(false);
      } else {
        setLoading(false);
        return null;
      }
    });
  }

  Future<void> orderNow(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading(true);

      final MyOrderModel myOrderModel = MyOrderModel(
        userId: 4,
        phone: phoneController.text,
        areaId: selectedAreaId!,
        address: addressController.text,
        note: noteController.text,
        status: 'Pending',
        total: int.parse(subTotal.toStringAsFixed(0)),
        cartItems: cartList,
      );

      print(jsonEncode(myOrderModel.toJson()));

      await _orderServices.createOrder(model: myOrderModel).then((value) {
        print(value);
        if (value != null) {
          setLoading(false);

          // print('value $value');

          Utils.snackBarPopUp(
              context, "Order Created Successfully", Colors.green);

          Navigator.pushReplacementNamed(context, RouteName.thankyou);

          cartList.clear();
          clearTextfield();
        } else {
          print('object');
          setLoading(false);
          return;
        }
      });
    }
  }

  //----------------- Clear Textformfield
  void clearTextfield() {
    phoneController.clear();
    addressController.clear();
    noteController.clear();
    notifyListeners();
  }
}
