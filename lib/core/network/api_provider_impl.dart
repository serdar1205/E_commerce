import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/network/api_provider.dart';

import 'dio_interceptor.dart';

class ApiProviderImpl implements ApiProvider {
  final Dio dio;

  ApiProviderImpl() : dio = _initializeDio();

  static Dio _initializeDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
      ),
    );
    dio.interceptors.addAll([
      TokenInterceptor(dio),
      // PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseHeader: true,
      // )
    ]);
    return dio;
  }


  @override
  Future<Response> get({
    String? baseUrl,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultiPart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultiPart) 'Content-Type': 'application/json',//'multipart/form-data',
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> post({
    String? baseUrl,
    required String endPoint,
    data,
    query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultiPart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultiPart) 'Content-Type': 'multipart/form-data',
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    return await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> put({
    String? baseUrl,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = Duration(seconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return await dio.put(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }
}
