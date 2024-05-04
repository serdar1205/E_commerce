import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tehno_mir/core/error/error_handler.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/usecases/products/get_product_usecase.dart';
import '../../core/constants/strings/app_strings.dart';
import '../../core/network/network.dart';
import '../../domain/repositories/product.dart';
import '../../domain/usecases/products/get_category_products_usecase.dart';
import '../data_sources/remote/products_remote_datasource.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(
      CategoryProductsQueryParams params,
      ) async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
    //  try {
        final response =
            await remoteDataSource.getCategoryProducts(params);
        // if (kDebugMode) {
        //   print(response);
        // }
        return Right(response);
      // } catch (error) {
      //   if (kDebugMode) {
      //     print(error);
      //   }
      //   return Left(ErrorHandler.handle(error).failure);
      // }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  // @override
  // Future<Either<Failure, List<ProductEntity>>> getAllProducts() async{
  //   final bool isConnected = await networkInfo.isConnected;
  //
  //   if (isConnected) {
  //     //  try {
  //     final response = await remoteDataSource.getAllProducts();
  //     // if (kDebugMode) {
  //     //   print(response);
  //     // }
  //     return Right(response);
  //     // } catch (error) {
  //     //   if (kDebugMode) {
  //     //     print(error);
  //     //   }
  //     //   return Left(ErrorHandler.handle(error).failure);
  //     // }
  //   } else {
  //     return const Left(OfflineFailure(AppStrings.noInternetError));
  //   }
  // }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSearchResult(String keyword)async {

    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
       try {
       final response = await remoteDataSource.getSearchResult(keyword);
      // if (kDebugMode) {
      //   print(response);
    //  }
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

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(ProductQueryParameters params)async {

    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
        try {
      final response = await remoteDataSource.getProducts(params);
      // if (kDebugMode) {
      //   print(response);
      // }
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
