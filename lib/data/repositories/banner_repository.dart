import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tehno_mir/core/error/error_handler.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/network/network.dart';
import 'package:tehno_mir/data/data_sources/remote/banner_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/banners.dart';
import 'package:tehno_mir/domain/repositories/banner.dart';

import '../../core/constants/strings/app_strings.dart';

class BannerRepositoryImpl extends BannerRepository {
  final BannerRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BannerRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo,});

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    final bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
       try {
        final response = await remoteDataSource.getBanners();
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
