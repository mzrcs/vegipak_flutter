import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:vegipak/app/model/user/user_model.dart';
import '../core/api/api.dart';
import '../dio/dio_interceptor.dart';
import '../model/general/general_model.dart';
import '../model/user/area_model.dart';
import '../model/user/sign_in_model.dart';
import '../model/user/sign_up_model.dart';
import '../model/user/token.dart';
import '../dio/dio_exception.dart';

class UserService {
  final _api = Api();

  Future<AuthModel?> signinUser({required SignInModel model}) async {
    try {
      Response response = await _api.sendRequest.post(
        "/auth/login",
        data: jsonEncode(model.toJson()),
      );

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // Convert raw data to model
      return AuthModel.fromJson(apiResponse.data);
    } on DioError catch (e) {
      // log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<AreaModel?> districtAreas() async {
    // Dio dios = await ApiInterceptor().getApiUser();
    try {
      Response response = await _api.sendRequest.get("/district-area/show");

      return AreaModel.fromJson(response.data);
    } on DioError catch (e) {
      DioException().dioError(e);
    }
    return null;
  }

  Future<SignUpAuthModel?> createAccount({required SignUpModel model}) async {
    try {
      Response response = await _api.sendRequest.post(
        "/auth/register",
        data: jsonEncode(model.toJson()),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // final signupResponse = apiResponse.data;

      // print('date'  + signupResponse);

      // // Convert raw data to model
      // return signupResponse;

      if (apiResponse.status == 200 || apiResponse.status == 201) {
        final signupResponse = SignUpAuthModel.fromJson(apiResponse.data);
        // print(response.data.toString());
        return signupResponse;
      }
    } on DioError catch (e) {
      // log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<AuthModel?> verifySignUpOTP({required VerifyOTPModel model}) async {
    try {
      Response response = await _api.sendRequest.post(
        "/user/verifyOTP",
        data: jsonEncode(model.toJson()),
      );

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // Convert raw data to model
      return AuthModel.fromJson(apiResponse.data);
    } on DioError catch (e) {
      // log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<dynamic> forgorPassword(dynamic data) async {
    try {
      Response response = await _api.sendRequest.post(
        "/user/forgetPassword",
        data: data,
      );

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // Convert raw data to model
      return apiResponse.data;
    } on DioError catch (e) {
      log('Error $e');
      DioException().dioError(e);
    }
    return null;
  }

  Future<dynamic> verifyForgetPasswordOTP({
    required VerifyOTPModel model,
  }) async {
    try {
      Response response = await _api.sendRequest.post(
        "/user/verifyForgetPasswordOTP",
        data: jsonEncode(model.toJson()),
      );

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // Convert raw data to model
      return apiResponse.data;
    } on DioError catch (e) {
      // log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<dynamic> updatePassword({required UpdatePasswordModel model}) async {
    Dio dios = await ApiInterceptor().getApiUser();

    try {
      // log('try');

      Response response = await dios.post(
        "$BASE_URL/user/passwordUpdate",
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          return response.data;
        }
      } else if (response.statusCode == 422) {
        log('response $response');
        return null;
      } else {
        return null;
      }
    } catch (error) {
      log('error $error');
    }
    return null;
  }

  Future<AuthModel?> upateMyProfile({
    required int authId,
    required UserModel model,
  }) async {
    Dio dios = await ApiInterceptor().getApiUser();

    try {
      Response response = await dios.post(
        "$BASE_URL/user/update/$authId",
        data: jsonEncode(model.updateJson()),
      );

      // log('response $response');

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      // Convert raw data to model
      return AuthModel.fromJson(apiResponse.data);
    } on DioError catch (e) {
      log('err $e');
      DioException().dioError(e);
    }
    return null;
  }

  Future<General?> generalSetting() async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      Response response = await dios.get("$BASE_URL/general-setting/show");

      return General.fromJson(response.data);
    } on DioError catch (e) {
      DioException().dioError(e);
    }
    return null;
  }
}
