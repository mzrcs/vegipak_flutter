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
