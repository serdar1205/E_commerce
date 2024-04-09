import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import '../usecases/products/get_product_usecase.dart';
import '../usecases/products/get_category_products_usecase.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(
      CategoryProductsQueryParams params,
  );

  //Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, List<ProductEntity>>> getSearchResult(String keyword);
  Future<Either<Failure, List<ProductEntity>>> getProducts(ProductQueryParameters params);

}
