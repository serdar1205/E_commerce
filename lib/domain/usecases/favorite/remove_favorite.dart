import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/repositories/favorite_repository.dart';

class RemoveFavoriteUseCase extends BaseUseCase<int, List<ProductEntity>> {
  final FavoriteRepository repository;

  RemoveFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> execute(input) async {
    return await repository.removeFavorite(input);
  }
}
