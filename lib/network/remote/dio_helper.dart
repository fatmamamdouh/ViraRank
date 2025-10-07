import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    print("Dio class is created");

    dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        sendTimeout: Duration(seconds: 60),
        baseUrl: 'https://c76b1ea926cc.ngrok-free.app/api',
        receiveDataWhenStatusError: true,
      ),
    );

  }

  static void headersOfAPI()
  {
    dio?.options.headers = {
      'Content-Type' : 'application/json',
    };
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {

    return dio!.get(
      options: Options(headers: {'Authorization': 'Bearer ${token}'},),
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token
  }) async {


    return dio!.post(
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {

    return dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {

    return dio!.patch(
      url,
      data: data,
      queryParameters: query,
    );
  }
}