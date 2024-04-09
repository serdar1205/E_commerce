import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/user.dart';
import '../../repositories/user_repository.dart';

class SignUpUseCase implements BaseUseCase<SignUpParams, void> {
  final UserRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, void>> execute(SignUpParams input) async {
    return await repository.signUp(input);
  }
}

class SignUpParams {
  final String userName;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  SignUpParams({
    required this.userName,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}
