import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tehno_mir/core/error/error_handler.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/network/network.dart';
import 'package:tehno_mir/data/data_sources/remote/category_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/category.dart';
import 'package:tehno_mir/domain/repositories/categories.dart';

import '../../core/constants/strings/app_strings.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryNames() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.getCategories();
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
