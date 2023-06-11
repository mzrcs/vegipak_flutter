import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/model/cart/cart_model.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';
import 'package:vegipak/app/utils/utils.dart';

import '../../../services/order_service.dart';
import '../../../utils/routes/routes_name.dart';
import '../../navigation_bar/provider/index_navigation.dart';

class CartProvider extends ChangeNotifier {
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

  Future<void> orderNow(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading(true);

      final MyOrderModel myOrderModel = MyOrderModel(
        userId: 1,
        phone: phoneController.text,
        areaId: 8,
        address: addressController.text,
        note: noteController.text,
        status: 'Pending',
        total: int.parse(subTotal.toStringAsFixed(0)),
        cartItems: cartList,
      );

      // print(jsonEncode(myOrderModel.toJson()));

      await _orderServices.createOrder(model: myOrderModel).then((value) {
        print(value);
        if (value != null) {
          setLoading(false);

          // print('value $value');

          Utils.snackBarPopUp(
              context, "Order Created Successfully", Colors.green);

          Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
          Navigator.pushReplacementNamed(context, RouteName.home);

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
