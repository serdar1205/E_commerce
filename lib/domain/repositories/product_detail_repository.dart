import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/product_detail.dart';

abstract class ProductDetailRepository {
  Future<Either<Failure, ProductDetailEntity>> getProductDetails(
    int productId,
  );
}
