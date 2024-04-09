import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/user_repository.dart';

class SignOutUseCase implements BaseUseCase<String, void> {
  final UserRepository repository;
  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> execute(String input) async{
    return await repository.signOut(input);
  }
}
