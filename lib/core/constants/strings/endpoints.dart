import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrlPath =  dotenv.env['BASE_URL']!;


String? code;
bool? isSkipedOnBoarding;
bool? isLoggedIN;

class ApiEndpoints{
  static const baseUrl = 'http://192.168.192.75:8000/api/';
  static const banners = 'shop/banners';
  static const images = 'http://192.168.192.75:8000';
  static const categories = 'product/categories';
  static const categoryProducts = 'product/category_products';
  static const productDetail = 'product/details';
  static const allProducts = 'product/';
  static const search = 'product/search';
  static const register = 'accaunt/register/';
  static const signIn = 'accaunt/login/';
  static const signOut = 'accaunt/logout/';
  static const refreshToken = 'accaunt/token/refresh/';
  static const cartItems = 'cart/cart-items';
  static const userData = 'accaunt/user_details/';

}