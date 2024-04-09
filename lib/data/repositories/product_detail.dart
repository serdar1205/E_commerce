import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/data/data_sources/remote/product_detail_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/product_detail.dart';
import 'package:tehno_mir/domain/repositories/product_detail_repository.dart';
import '../../core/constants/strings/app_strings.dart';
import '../../core/network/network.dart';

class ProductDetailRepositoryImpl extends ProductDetailRepository{

  final NetworkInfo networkInfo;
  final ProductDetailRemoteDataSource remoteDataSource;

  ProductDetailRepositoryImpl({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, ProductDetailEntity>> getProductDetails(int productId) async{

    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      //  try {
      final response =
          await remoteDataSource.getProductDetail(productId);
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

}