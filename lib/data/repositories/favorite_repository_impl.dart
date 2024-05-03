import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/constants/strings/app_strings.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/network/network.dart';
import 'package:tehno_mir/data/data_sources/remote/favorite_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final NetworkInfo networkInfo;
  final FavoriteRemoteDataSource remoteDataSource;

  FavoriteRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> addFavorite(
      int productId) async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      //  try {
      final response = await remoteDataSource.addFavorite(productId);
      // if (kDebugMode) {
      //   print(response);
      //  }
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

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      //  try {
      final response = await remoteDataSource.getFavorites();
      // if (kDebugMode) {
      //   print(response);
      //  }
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

  @override
  Future<Either<Failure, List<ProductEntity>>> removeFavorite(int productId) async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      //  try {
      final response = await remoteDataSource.removeFavorite(productId);
      // if (kDebugMode) {
      //   print(response);
      //  }
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
