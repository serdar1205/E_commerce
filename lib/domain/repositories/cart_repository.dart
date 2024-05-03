import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/usecases/cart/update_cart_item.dart';

import '../entities/cart/cart_item.dart';

abstract class CartRepository{
  Future<Either<Failure, CartItemsEntity>> getCartItems();
  Future<Either<Failure, CartItemsEntity>> updateCartItems(UpdateCartItemParams params);
  Future<Either<Failure, double>> getTotalCostOfCart();
  Future<Either<Failure, CartItemsEntity>> removeCartItem(int productId);
  Future<Either<Failure, void>> clearCart();
  Future<Either<Failure, CartItemsEntity>> addCartItem(int productId);
//  Future<Either<Failure, int>> getTotalItems();
}