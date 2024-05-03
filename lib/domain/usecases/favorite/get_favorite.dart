import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/repositories/favorite_repository.dart';

class GetFavoriteUseCase extends BaseUseCase<NoParams, List<ProductEntity>> {
  final FavoriteRepository repository;

  GetFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> execute( input) async {
    return await repository.getFavorites();
  }
}