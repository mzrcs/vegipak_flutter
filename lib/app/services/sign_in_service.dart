import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../darta/models/user/user_model.dart';
import '../darta/models/user/sign_in_token.dart';
import '../core/api/api_baseurl.dart';
import '../core/api/api_endpoints.dart';
import '../utils/dio_exception.dart';

class SigninServices {
  Dio dio = Dio();

  Future<TokenModel?> signinUser(
    UserModel model,
    BuildContext context,
  ) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndPoints.signIn,
        data: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return TokenModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      // log(e.message);
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
