import 'package:dio/dio.dart';

import '../../local/token_store.dart';



class TokenInterceptor extends Interceptor {
  Dio _dio;

  TokenInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await Store.getToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode== 403) {
      try {
        await refreshToken();
        RequestOptions options = err.response!.requestOptions;
        String? token = await Store.getToken();
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
          await _dio.fetch(options);
          return;
        }
      } catch (e) {
        print("Failed to refresh token: $e");
        // Navigator.push(
        //     GlobalData.homeContext!,
        //     MaterialPageRoute(builder: (context) => const LoginScreen());
      }
    }
    super.onError(err, handler);
  }

  Future<void> refreshToken() async {
    try {
      String? token = await Store.getToken();

      if (token != null) {
        var response = await _dio.post(
          "/auth/refresh",
          options: Options(
            headers: {"Refresh-Token": token},
          ),
        );

        if (response.statusCode == 200) {
          String newToken = response.data["access_token"];
          await Store.setToken(newToken);
          // Here you can also update the user data and set new tokens in request headers if needed
          // updateUser(response.data["user"]); // Example method to update user data
          // setRequestHeaders(newToken, token); // Example method to set new request headers
        } else {
          throw DioError(
            response: Response(
              statusCode: response.statusCode,
              requestOptions: response.requestOptions,
              data: response.data,
              headers: response.headers,
              statusMessage: response.statusMessage,
            ),
            requestOptions: response.requestOptions,
          );
        }
      } else {
        throw Exception("Token is null");
      }
    } catch (e) {
      throw Exception("Failed to refresh token: $e");
    }
  }
  void setRequestHeaders(String accessToken, String refreshToken) {
    // This method is used to set new tokens in request headers
    // Example implementation, replace it with your actual logic
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
    _dio.options.headers['Refresh-Token'] = refreshToken;
  }
}




