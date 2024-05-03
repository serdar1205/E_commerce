import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:tehno_mir/core/error/failure.dart';

import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/usecases/cart/update_cart_item.dart';

import '../../core/constants/strings/app_strings.dart';
import '../../core/error/error_handler.dart';
import '../../core/network/network.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_sources/remote/cart_remote_datasource.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo,});


  @override
  Future<Either<Failure, CartItemsEntity>> getCartItems()async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.getCartItems();
        // if (kDebugMode) {
        //   print(response);
        // }
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
      //    print(error);
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, CartItemsEntity>> updateCartItems(UpdateCartItemParams params)async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.updateCartItem(params);
        // if (kDebugMode) {
        //   print(response);
        // }
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
     //     print(error);
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, double>> getTotalCostOfCart()async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.getTotalCostOfCart();
        // if (kDebugMode) {
        //   print(response);
        // }
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
          //     print(error);
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, CartItemsEntity>> removeCartItem(int productId)async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.removeCartItems(productId);
        // if (kDebugMode) {
        //   print(response);
        // }
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
          //    print(error);
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async{
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.clearCart();
        // if (kDebugMode) {
        //   print(response);
        // }
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
          //    print(error);
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, CartItemsEntity>> addCartItem(int productId)async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.addCartItem(productId);

        return Right(response);
      } catch (error) {
        if (kDebugMode) {
              print(error);
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }
}