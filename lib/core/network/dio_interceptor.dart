import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/local/token_store.dart';
import 'package:tehno_mir/core/utilities/global_data.dart';
import 'package:tehno_mir/presentation/pages/registration/sign_up/registration_page.dart';

class TokenInterceptor extends Interceptor {
  Dio dio;

  TokenInterceptor(this.dio);

  bool _requiresToken(RequestOptions options) {
    final apiPathsRequiringToken = [
      ApiEndpoints.cartItems,
      ApiEndpoints.userData,
      ApiEndpoints.updateCartItems,
      ApiEndpoints.cartItemsTotalCost,
      ApiEndpoints.removeCartItem,
      ApiEndpoints.clearCart,
      ApiEndpoints.addItemToCart,
      ApiEndpoints.order,
      ApiEndpoints.orderPreview,
      ApiEndpoints.favorites,
    ];
    return apiPathsRequiringToken.contains(options.path);
    // return apiPathsRequiringToken.any((path) => options.path.startsWith(path));
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await Store.getToken();
    String? ref = await Store.getRefreshToken();
    if (token != null) {


      if (_requiresToken(options)) {
        options.headers["Authorization"] = "Bearer $token";

      }
    } else {
    }
    super.onRequest(options, handler);
  }

//wolfx

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
  //  String? token = await Store.getToken();
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      try {
        await refreshToken();
        RequestOptions options = err.response!.requestOptions;
        String? token = await Store.getToken();
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
          await dio.fetch(options);
          return;
        }
      } catch (e) {
        debugPrint("Failed to refresh token: $e");
        await Store.clear();
        //dine 1 gezek pusederyaly etmeli

        // Navigator.pushAndRemoveUntil(
        //     GlobalData.homeContext!,
        //     MaterialPageRoute(builder: (context) => const RegistrationPage()),
        //         (Route<dynamic> route) => false);
        Navigator.push(GlobalData.homeContext!,
            MaterialPageRoute(builder: (context) => const RegistrationPage()));
      }
    }
    super.onError(err, handler);
  }

  Future<void> refreshToken() async {
    try {
      String? refreshToken = await Store.getRefreshToken();

      if (refreshToken != null) {
        var response = await dio
            .post(ApiEndpoints.refreshToken,
                data: {'refresh': refreshToken}
                // options: Options(
                //   headers: {"Refresh-Token": refreshToken},
                // ),
                );

        if (response.statusCode == 200) {
          String newAccessToken = response.data["access"];
          await Store.setToken(newAccessToken);
          // Here you can also update the user data and set new tokens in request headers if needed
          // updateUser(response.data["user"]); // Example method to update user data
          // setRequestHeaders(newToken, token); // Example method to set new request headers
        } else {
          throw DioException(
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
        throw Exception("---------Token is null----------");
      }
    } catch (e) {
      throw Exception("------------Failed to refresh token:------------- $e");
    }
  }
// void setRequestHeaders(String accessToken, String refreshToken) {
//   // This method is used to set new tokens in request headers
//   // Example implementation, replace it with your actual logic
//   dio.options.headers['Authorization'] = 'Bearer $accessToken';
//   dio.options.headers['Refresh-Token'] = refreshToken;
// }
}
