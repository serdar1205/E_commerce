import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/repositories/product.dart';

class GetProductUseCase extends BaseUseCase<ProductQueryParameters, List<ProductEntity>> {
  final ProductsRepository repository;

  GetProductUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> execute(
      ProductQueryParameters input) async {
    return await repository.getProducts(input);
  }
}

class ProductQueryParameters {
  final String? order;
  final String? sortBy;
  final int? limit;

  ProductQueryParameters({this.order, this.sortBy, this.limit});

  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> params = {};
    if (order != null) params['order'] = order;
    if (sortBy != null) params['sortBy'] = sortBy;
    if (limit != null) params['limit'] = limit.toString();
    return params;
  }
}

