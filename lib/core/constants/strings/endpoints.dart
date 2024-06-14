import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrlPath =  dotenv.env['BASE_URL']!;


String? code;
bool? isSkipedOnBoarding;
bool? isLoggedIN;

class ApiEndpoints{
  static const baseUrl = '';
  static const banners = 'shop/banners';
  static const images = '';
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
  static const aboutUs = 'shop/info';
  static const updateCartItems = 'cart/update-item';
  static const cartItemsTotalCost = 'cart/total_cost';
  static const totalItems = 'cart/number_of_items';
  static const removeCartItem = 'cart/remove-item';
  static const clearCart = 'cart/empty-cart';
  static const addItemToCart = 'cart/add-item';
 // static const orderHistory = 'orders/details';
  static const orderPreview = 'orders/preview';
  static const order = 'orders/';
  static const favorites = 'product/favourites';

}
