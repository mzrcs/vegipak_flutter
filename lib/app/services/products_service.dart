import 'dart:developer';

import 'package:dio/dio.dart';
import '../core/api/api.dart';
import '../dio/dio_interceptor.dart';
import '../model/product/product_model.dart';
// import '../dio/dio_exception.dart';

class ProductServices {
  Future<dynamic> vegitableProducts(context) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      Response response = await dios.get("$BASE_URL/product/show");

      // Response response = await Dio().get("https://reqres.in/api/users/23");

      log('statusCode ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<ProductModel> productList =
            (response.data['products'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();

        // Convert raw data to model
        return productList;
      }
    } on DioError catch (e) {
      log('e ${e.message.toString()}');

      if (e.response != null) {
        throw e.response!.statusCode!;
      }
    }
    return null;
  }
}
