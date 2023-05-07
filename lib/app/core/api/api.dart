import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "https://vegipak.com/public/api";
const Map<String, dynamic> DEFAULT_HEADERS = {
  'Content-Type': 'application/json'
};

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.headers = DEFAULT_HEADERS;
    _dio.interceptors.add(PrettyDioLogger(
        // requestBody: true,
        // requestHeader: true,
        // responseBody: true,
        // responseHeader: true,
        ));
  }

  Dio get sendRequest => _dio;
}

class ApiResponse {
  int status;
  dynamic data;
  String? message;

  ApiResponse({required this.status, this.data, this.message});

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    // print('error data $data');
    return ApiResponse(
      status: data["status"],
      data: data["body"],
      message: data["message"] ?? "Unexpected error",
    );
  }
}
