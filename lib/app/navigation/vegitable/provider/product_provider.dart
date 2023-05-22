import 'package:flutter/material.dart';
import 'package:vegipak/app/services/products_service.dart';

import '../../../model/product/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider(context) {
    getVegitableProduct(context);
  }

  int gridView = 2;

  void setGridView(int value) {
    gridView = value;
    notifyListeners();
  }



  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //-----------------------------------------------------*Get productList
  List<ProductModel> productList = [];
  ProductServices product = ProductServices();

  void getVegitableProduct(context) async {
    // log("message");
    setLoading(true);
    await product.vegitableProducts(context).then((value) {
      if (value != null) {
        // log("message");
        productList = value;
        notifyListeners();

        setLoading(false);
      } else {
        setLoading(false);
        return null;
      }
    });
  }
}
