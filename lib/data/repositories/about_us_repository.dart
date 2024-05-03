import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tehno_mir/data/data_sources/remote/about_us_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/about_us.dart';
import 'package:tehno_mir/domain/repositories/about_us_repository.dart';

import '../../core/constants/strings/app_strings.dart';
import '../../core/error/error_handler.dart';
import '../../core/error/failure.dart';
import '../../core/network/network.dart';

class AboutUsRepositoryImpl implements AboutUsRepository {
  final AboutUsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AboutUsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo,});

  @override
  Future<Either<Failure, AboutUsEntity>> getShopInfo() async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDataSource.getShopInfo();
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