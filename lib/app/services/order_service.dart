import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vegipak/app/model/order/my_order_model.dart';
import '../core/api/api.dart';
import '../dio/dio_exception.dart';
import '../dio/dio_interceptor.dart';
import '../model/user/area_model.dart';

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

      if (response.statusCode == 200) {
        if (response.data == null) {
          return null;
        } else {
          return response.data;
        }
      } else {
        log('response $response');
        return null;
      }

      // // Convert raw data to model
      // return apiResponse.data;
    } on DioError catch (e) {
      // log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<List<MyOrderModel>?> getMyOrders({
    required BuildContext context,
    required String currentDate,
    required String lastWeekDate,
  }) async {
    // Dio dios = await ApiInterceptor().getApiUser();
    try {
      // Response response = await dios
      //     .get("$BASE_URL/order/show23?to=$currentDate&from=$lastWeekDate");

      Response response = await Dio().get(
        "$BASE_URL/order/show?to=$currentDate&from=$lastWeekDate",
        options: Options(headers: await headerWithAuth()),
      );

      log('response myOrder ${response.data}');

      // ApiResponse apiResponse = ApiResponse.fromResponse(response);

      final List<MyOrderModel> orderList = (response.data['orders'] as List)
          .map((e) => MyOrderModel.fromJson(e))
          .toList();

      // Convert raw data to model
      return orderList;
    } on DioError catch (e) {
      // log(e.message.toString());
      // DioException().dioError(e);

      log('e ${e.message.toString()}');

      if (e.response != null) {
        throw e.response!.statusCode!;
      }
    }
    return null;
  }

  // Future<dynamic> vegitableProducts(context) async {
  //   // Dio dios = await ApiInterceptor().getApiUser();
  //   try {
  //     Response response = await Dio().get(
  //       "$BASE_URL/product/show33",
  //       options: Options(headers: await headerWithAuth()),
  //     );

  //     log('statusCode ${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       final List<ProductModel> productList =
  //           (response.data['products'] as List)
  //               .map((e) => ProductModel.fromJson(e))
  //               .toList();

  //       // Convert raw data to model
  //       return productList;
  //     }
  //   } on DioError catch (e) {
  //     log('e ${e.message.toString()}');

  //     if (e.response != null) {
  //       throw e.response!.statusCode!;
  //     }
  //   }
  //   return null;
  // }

  Future<AreaModel?> districtAreas() async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      Response response = await dios.get("$BASE_URL/district-area/show");

      return AreaModel.fromJson(response.data);
    } on DioError catch (e) {
      DioException().dioError(e);
    }
    return null;
  }
}
