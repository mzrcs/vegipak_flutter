import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vegipak/app/auth/sign_up/model/sign_up_token.dart';
import 'package:vegipak/app/darta/models/user/sign_in_token.dart';

import '../../core/api/api.dart';
import '../models/user/user_model.dart';

class UserRepository {
  final _api = Api();

  // Future<UserModel> createAccount(
  //     {required String email, required String password}) async {
  //   try {
  //     Response response = await _api.sendRequest.post("/user/createAccount",
  //         data: jsonEncode({"email": email, "password": password}));
  //     ApiResponse apiResponse = ApiResponse.fromResponse(response);

  //     if (!apiResponse.success) {
  //       throw apiResponse.message.toString();
  //     }

  //     // Convert raw data to model
  //     return UserModel.fromJson(apiResponse.data);
  //   } catch (ex) {
  //     rethrow;
  //   }
  // }

  Future<TokenModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await _api.sendRequest.post("/auth/login",
          data: jsonEncode({
            "email": email,
            "password": password,
          }));
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // Convert raw data to model
      return TokenModel.fromJson(apiResponse.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TokenModel> createAccount({required dynamic data}) async {
    try {
      Response response =
          await _api.sendRequest.post("/auth/register", data: jsonEncode(data));
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (apiResponse.status != 200) {
        throw apiResponse.message.toString();
      }

      // Convert raw data to model
      return TokenModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
