import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';
import '../core/api/api.dart';
import '../dio/dio_exception.dart';
import '../dio/dio_interceptor.dart';

class OrderService {
  // final _api = Api();

  Future<dynamic> createOrder({required MyOrderModel model}) async {
    Dio dios = await ApiInterceptor().getApiUser();

    try {
      // Response response = await _api.sendRequest.post(
      //   "/order/store",
      //   data: jsonEncode(model.toJson()),
      // );

      Response response = await dios.post(
        "$BASE_URL/order/store",
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          return response.data;
        }
      } else {
        return null;
      }

      // // Convert raw data to model
      // return apiResponse.data;
    } on DioError catch (e) {
      log('happenss');
      log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }
}
