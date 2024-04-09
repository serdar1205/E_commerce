import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../usecases/user/sign_in_usecase.dart';
import '../usecases/user/sign_up_usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> signIn(SignInParams params);
  Future<Either<Failure, void>> signUp(SignUpParams params);
  Future<Either<Failure, void>> signOut(String refreshToken);
  Future<Either<Failure, UserEntity>> getUser();
}