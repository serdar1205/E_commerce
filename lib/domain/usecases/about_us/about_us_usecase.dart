import 'package:dartz/dartz.dart';
import 'package:tehno_mir/domain/entities/about_us.dart';
import 'package:tehno_mir/domain/repositories/about_us_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';

class GetAboutUsUseCase extends BaseUseCase<NoParams, AboutUsEntity> {
  final AboutUsRepository repository;

  GetAboutUsUseCase({required this.repository});

  @override
  Future<Either<Failure, AboutUsEntity>> execute( input) async {
    return await repository.getShopInfo();
  }
}