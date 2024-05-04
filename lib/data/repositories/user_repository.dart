import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/data/data_sources/remote/user_remote_datasource.dart';
import 'package:tehno_mir/domain/entities/user.dart';
import 'package:tehno_mir/domain/usecases/user/sign_in_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_up_usecase.dart';
import '../../core/constants/strings/app_strings.dart';
import '../../core/error/error_handler.dart';
import '../../core/network/network.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{


  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.networkInfo, required this.remoteDataSource});




  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams params)async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.signIn(params);
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
          print(error.toString()+'repository repository');
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, void>> signOut(String refreshToken)async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.signOut(refreshToken);
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
          print(error.toString()+'sign Out repository');
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params)async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.signUp(params);
        return Right(response);
      } catch (error) {
        if (kDebugMode) {
          print(error.toString()+'repository repository');
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async{
    print('///////////////////////////');
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.getUser();
        print('///////////////////////////');

        print(response.userName);
        print('///////////////////////////');
        return Right(response);
      }
       catch (error) {
        if (kDebugMode) {
          print('${error}repository repository');
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }
}