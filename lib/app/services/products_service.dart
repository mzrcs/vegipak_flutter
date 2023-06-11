import 'package:dio/dio.dart';
import '../core/api/api.dart';
import '../dio/dio_interceptor.dart';
import '../model/product/product_model.dart';
import '../dio/dio_exception.dart';

class ProductServices {
  Future<List<ProductModel>?> vegitableProducts(context) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      
      Response response = await dios.get("$BASE_URL/product/show");

      // ApiResponse apiResponse = ApiResponse.fromResponse(response);

      final List<ProductModel> productList = (response.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();

      // Convert raw data to model
      return productList;
    } on DioError catch (e) {
      // log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }
}
