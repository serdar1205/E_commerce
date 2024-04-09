import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/user.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/user_repository.dart';

class SignInUseCase implements BaseUseCase<SignInParams, void> {
  final UserRepository repository;
  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, void>> execute(SignInParams input)async {
   return await repository.signIn(input);
  }
}

class SignInParams {
  final String phoneNumber;
  final String password;
  const SignInParams({
    required this.phoneNumber,
    required this.password,
  });
}