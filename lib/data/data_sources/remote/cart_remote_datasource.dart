import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tehno_mir/core/error/error_handler.dart';
import 'package:tehno_mir/data/models/cart/cart_item_model.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/usecases/cart/update_cart_item.dart';

import '../../../core/constants/strings/endpoints.dart';
import '../../../core/network/api_provider.dart';

abstract class CartRemoteDataSource {
  Future<CartItemsEntity> getCartItems();

  Future<CartItemsEntity> updateCartItem(UpdateCartItemParams params);

  Future<double> getTotalCostOfCart();

  Future<CartItemsEntity> removeCartItems(int productId);

  Future<void> clearCart();
  Future<CartItemsEntity> addCartItem(int productId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiProvider apiProvider;

  CartRemoteDataSourceImpl(this.apiProvider);

  @override
  Future<CartItemsEntity> getCartItems() async {
    final response = await apiProvider.get(endPoint: ApiEndpoints.cartItems);
    //   print(response);
    if (response.statusCode == 200) {
      //  print(response.data);
      return CartItemModel.fromJson(response.data);
    } else {
     throw ErrorHandler.handle(response.statusCode);
    }
  }

  @override
  Future<CartItemsEntity> updateCartItem(UpdateCartItemParams params) async {
    var formData = FormData.fromMap({
      'product_id': params.productId,
      'count': params.count,
    });
    final response = await apiProvider.put(
      endPoint: ApiEndpoints.updateCartItems,
      data: formData,
      isMultipart: true,
    );
    if (response.statusCode == 200) {
      //  print(response.data);
      return CartItemModel.fromJson(response.data);
    } else {
      print('------------Error in  updateCartItem---------');
      print(response.data);
      throw '';
    }
  }

  @override
  Future<double> getTotalCostOfCart() async {
    final response =
        await apiProvider.get(endPoint: ApiEndpoints.cartItemsTotalCost);
    //   print(response);
    if (response.statusCode == 200) {
      print(response.data);
      final totalPriceData = jsonEncode(response.data['total_cost']);
      final totalPrice = double.parse(totalPriceData);
      print(totalPrice.runtimeType);
      return totalPrice;
    } else {
      print('------------Error in  getCartItems---------');
      print(response.data);
      throw '';
    }
  }

  @override
  Future<CartItemsEntity> removeCartItems(int productId) async {
    var formData = FormData.fromMap({
      'product_id': productId,
    });
    final response = await apiProvider.delete(
      endPoint: ApiEndpoints.removeCartItem,
      data: formData,
    );
    if (response.statusCode == 200) {
      //  print(response.data);
      return CartItemModel.fromJson(response.data);
    } else {
      print('------------Error in  updateCartItem---------');
      print(response.data);
      throw '';
    }
  }

  @override
  Future<void> clearCart() async {
    final response = await apiProvider.delete(endPoint: ApiEndpoints.clearCart);
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print('------------Error in  updateCartItem---------');
      print(response.data);
      throw '';
    }
  }

  @override
  Future<CartItemsEntity> addCartItem(int productId)async {
    final response = await apiProvider.post(
      endPoint: ApiEndpoints.addItemToCart,
      query: {'product_id':productId}
    );
    if (response.statusCode == 200) {

      return CartItemModel.fromJson(response.data);
    } else {
      print('------------Error in  addCartItem---------');
      print(response.data);
      throw '';
    }
  }
}
