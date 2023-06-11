import 'dart:convert';
import 'package:dio/dio.dart';
import '../core/api/api.dart';
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

  Future<SignUpToken?> createAccount({required SignUpModel model}) async {
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
        final signupResponse = SignUpToken.fromJson(apiResponse.data);
        print(response.data.toString());
        return signupResponse;
      }
    } on DioError catch (e) {
      // log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
