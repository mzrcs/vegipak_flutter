import 'dart:developer';
// import 'dart:js';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dio_exception.dart';

class ApiInterceptor {
  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  Dio dio = Dio();

  Future<Dio> getApiUser() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          //--------------------onrequest
          final token = await storage.read(key: 'token');
          log('Bearer $token');
          dio.interceptors.clear();
          options.headers.addAll({"Authorization": "Bearer $token"});

          return handler.next(options);
        },
        onResponse: (response, handler) {
          //--------------------onresponse
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          //--------------------onerror
          if (e.response != null) {
            if (e.response?.statusCode == 403 &&
                e.response?.data['message'] == 'Forbidden') {
              log('token expired');
              RequestOptions requestOptions = e.requestOptions;
              // try {
              //   final refreshToken = await storage.read(key: 'refreshToken');
              //   log(refreshToken.toString());
              //   final opts = Options(method: requestOptions.method);
              //   dio.options.headers["refresh"] = "Bearer $refreshToken";
              //   final Response response = await dio.get(
              //     ApiBaseUrl().baseUrl + ApiEndPoints.refreshToken,
              //     options: opts,
              //   );
              //   if (response.statusCode! == 200) {
              //     log(response.data.toString());
              //     final token = response.data['accessToken'];
              //     final refreshToken = response.data['refreshToken'];
              //     await storage.delete(key: 'token');
              //     await storage.delete(key: 'refreshToken');
              //     storage.write(key: 'token', value: token);
              //     storage.write(key: 'refreshToken', value: refreshToken);
              //   }
              // } catch (e) {
              //   DioException().dioError(e);
              // }
              try {
                final token = await storage.read(key: 'token');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["Authorization"] = "Bearer $token";
                final response = await dio.request(
                  requestOptions.path,
                  options: opts,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                );
                return handler.resolve(response);
              } catch (e) {
                DioException().dioError(e);
              }
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
