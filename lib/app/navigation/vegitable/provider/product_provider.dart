import 'dart:developer';
// import 'dart:js';

// import 'package:dio/dio.dart';
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

  bool _showError = false;
  bool get isError => _showError;

  bool connectInternet = true;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //-----------------------------------------------------*Get productList
  List<ProductModel> productList = [];
  List<ProductModel> searchProductList = [];
  ProductServices product = ProductServices();

  //-----------------------------------------------------*Search Visibility get set
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  final searchController = TextEditingController();
  getSearchResult(String value) {
    searchProductList.clear();
    notifyListeners();
    for (var index in productList) {
      if (index.englishName.toString().toLowerCase().contains(
            value.toLowerCase(),
          )) {
        notifyListeners();
        ProductModel data = ProductModel(
          id: index.id,
          englishName: index.englishName,
          urduName: index.urduName,
          description: index.description,
          unit: index.unit,
          regularPrice: index.regularPrice,
          salePrice: index.salePrice,
          imageUrl: index.imageUrl,
          status: index.status,
          createAt: index.createAt,
          updateAt: index.updateAt,
        );
        notifyListeners();
        searchProductList.add(data);
        notifyListeners();
      }
    }
  }


  Future<void> getVegitableProduct(context) async {
    _showError = false;
    try {
      productList.clear();
      setLoading(true);

      final response = await product.vegitableProducts(context);

      if (response != null) {
        productList = response;
        notifyListeners();

        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (e) {
      log('ERORR: $e');
      setLoading(false);
      if (e == 404 || e == 500) {
        _showError = true;
        notifyListeners();
      }
    }
  }
}
