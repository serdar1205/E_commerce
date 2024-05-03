import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<ProductEntity>>> getFavorites();

  Future<Either<Failure, List<ProductEntity>>> addFavorite(int productId);
  Future<Either<Failure, List<ProductEntity>>> removeFavorite(int productId);

}