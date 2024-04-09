import 'package:shared_preferences/shared_preferences.dart';

class Store {
  const Store._();
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const String _tokenKey = 'token';
  static const String _refreshTokenKey = 'refreshToken';

  static Future<void> setToken(String token) async {
    await _preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    return _preferences.getString(_tokenKey);
  }

  // static Future<void> removeAccessToken() async {
  //   await _preferences.remove(_tokenKey);
  // }

  static Future<void> setRefreshToken(String token) async {
    await _preferences.setString(_refreshTokenKey, token);
  }

  static Future<String?> getRefreshToken() async {
    return _preferences.getString(_refreshTokenKey);
  }

  static Future<void> clear() async {
    await _preferences.clear();
  }
  static Future<bool> isTokenAvailable() async {
    String? token = _preferences.getString( _tokenKey);
    return Future.value((token != null));
  }
}