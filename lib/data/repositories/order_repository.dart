import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tehno_mir/core/constants/strings/app_strings.dart';
import 'package:tehno_mir/core/error/error_handler.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/network/network.dart';
import 'package:tehno_mir/data/data_sources/remote/order_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/order/order.dart';
import 'package:tehno_mir/domain/entities/order/order_preview.dart';
import 'package:tehno_mir/domain/repositories/order_repository.dart';
import 'package:tehno_mir/domain/usecases/order/order_product.dart';

class OrderRepositoryImpl implements OrderRepository {
  final NetworkInfo networkInfo;

  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, OrderPreviewEntity>> getOrderPreview() async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.getOrderPreview();
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

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrderedHistory() async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.getOrderedHistory();
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

  @override
  Future<Either<Failure, OrderEntity>> orderProduct(
      OrderProductParams params) async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.orderProduct(params);
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
