import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/user.dart';
import 'package:tehno_mir/domain/repositories/user_repository.dart';

class GetUserUseCase implements BaseUseCase<NoParams, UserEntity> {
  final UserRepository repository;
  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> execute(NoParams input)async {
    return await repository.getUser();
  }
}