import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/model/cart/cart_model.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';
import 'package:vegipak/app/model/user/area_model.dart';
import 'package:vegipak/app/navigation/order/provider/order_prov.dart';
import 'package:vegipak/app/utils/utils.dart';
import '../../../auth/provider/user_provider.dart';
import '../../../model/user/user_model.dart';
import '../../../services/order_service.dart';
import '../../../utils/field_validator.dart';
import '../../../utils/routes/routes_name.dart';

class CartProvider extends ChangeNotifier {
  // CartProvider(context) {
  //   getDistrictArea();
  //   getSavedData(context);
  // }

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
    clearTextfield();
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

  int? authId;
  int? selectedAreaId;
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final noteController = TextEditingController();
  final textFieldValidator = TextFieldValidators();

  final formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool get isLoading => _loading;

  bool _showError = false;
  bool get isError => _showError;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loadingData = false;
  bool get isLoadingData => _loadingData;

  setLoadingData(bool value) {
    _loadingData = value;
    notifyListeners();
  }

  selectAreaId(int value) {
    selectedAreaId = value;
    notifyListeners();
  }

  UserModel userModel = UserModel();

  Future<void> getSavedData(context) async {
    _showError = false;
    setLoadingData(true);
    final userPrefrence = Provider.of<UserProvider>(context, listen: false);
    await userPrefrence.getSaveUser(userModel);
    Future.delayed(Duration.zero).then((value) async {
      authId = userModel.id;
      phoneController.text = userModel.phone;
      addressController.text = userModel.address;
      selectedAreaId = userModel.districtAreaId;
      setLoadingData(false);
    });

    log('area Id ${userModel.districtAreaId}');
  }

  Future getDistrictArea() async {
    // log("message");
    setLoadingData(true);
    await _orderServices.districtAreas().then((value) {
      if (value != null) {
        // print(value.districtAreas);
        districtAreaList = value.districtAreas!;
        notifyListeners();

        setLoadingData(false);
      } else {
        setLoadingData(false);
        return null;
      }
    });
  }

  Future<void> orderNow(BuildContext context) async {
    _showError = false;
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        setLoading(true);

        final MyOrderModel myOrderModel = MyOrderModel(
          userId: authId!,
          phone: phoneController.text,
          areaId: selectedAreaId!,
          address: addressController.text,
          note: noteController.text,
          status: 'Pending',
          total: int.parse(subTotal.toStringAsFixed(0)),
          cartItems: cartList,
        );

        await _orderServices.createOrder(model: myOrderModel).then((value) {
          print('value $value');
          if (value != null) {
            setLoading(false);
            Map<String, dynamic> responseData = value;

            if (responseData.containsKey('status')) {
              int statusCode = responseData['status'];
              List<dynamic> errorMessages = responseData['message'];

              if (statusCode == 500) {
                for (dynamic errorMessage in errorMessages) {
                  print('Error Message: $errorMessage');

                  Utils.snackBarPopUp(
                    context,
                    errorMessage,
                    Colors.red,
                    duration: 6,
                  );
                  // Show an error message to the user
                  // You can use a Flutter widget to display the error message
                }
              }
            } else {
              Utils.snackBarPopUp(
                  context, "Order Created Successfully", Colors.green);

              Navigator.pushReplacementNamed(context, RouteName.thankyou);

              Provider.of<OrderProvider>(context, listen: false)
                  .getMyOrders(context);

              cartList.clear();
              clearTextfield();
            }
          } else {
            setLoading(false);
            return;
          }
        });
      }
    } catch (e) {
      log('ERORR new: $e');
      setLoading(false);
      // cartList.clear();
      clearTextfield();
      if (e == 404 || e == 500) {
        _showError = true;
        notifyListeners();
      }
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
