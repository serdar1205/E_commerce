import 'package:dio/dio.dart';

import '../../local/token_store.dart';



addInterceptors(Dio dio) {
  dio.interceptors.add(DioInterceptor());
}

class DioInterceptor extends Interceptor {
  Dio dio = Dio(BaseOptions(baseUrl: "base-api-url"));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    final token = await Store.getToken();
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    // get token from the storage

    if (token != null) {
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    return super.onRequest(options, handler);
  }
  //
  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   return super.onResponse(response,handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the user is unauthorized.
    if (err.response?.statusCode == 401) {
      // Refresh the user's authentication token.
      await refreshToken();
      // Retry the request.
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        // If the request fails again, pass the error to the next interceptor in the chain.
        handler.next(e);
      }
      // Return to prevent the next interceptor in the chain from being executed.
      return;
    }
    // Pass the error to the next interceptor in the chain.
    handler.next(err);
  }

  Future<Response<dynamic>> refreshToken() async {
    var response = await dio.post("/auth/refresh",
        options: Options(
            headers: {"Refresh-Token": Store.getToken()}));

    if (response.statusCode == 200) {
      // UserModel user = UserModel.fromMap(response.data['data']);
      // AppProvider.box?.put('user', user.toJson());
      // AuthProvider.user = user;
      //
      // setRequestHeaders(
      //   accessToken: user.access_token,
      //   rfsToken: user.refresh_token,
      // );
    }
    return response;
  }


  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    // Create a new `RequestOptions` object with the same method, path, data, and query parameters as the original request.
    final options = Options(
      method: requestOptions.method,
      headers: {
        // "Authorization": "Bearer ${MemoryManagement.getLoginToken()}",
        // "access-token": "Bearer ${MemoryManagement.getAccessToken()}"
      },
    );

    // Retry the request with the new `RequestOptions` object.
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}