import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/repositories/product.dart';

class GetCategoryProductsUseCase extends BaseUseCase<CategoryProductsQueryParams, List<ProductEntity>>{

  final ProductsRepository repository;

  GetCategoryProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> execute(CategoryProductsQueryParams input) async{
    return await repository.getCategoryProducts(input);
  }
}
class CategoryProductsQueryParams{
  final int categoryId;
  final String? order;
  final String? sortBy;
  final int? limit;

  const CategoryProductsQueryParams({this.order, this.sortBy, this.limit, required this.categoryId});

  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> params = {};
    params['category_id'] = categoryId;
    if (order != null) params['order'] = order;
    if (sortBy != null) params['sortBy'] = sortBy;
    if (limit != null) params['limit'] = limit.toString();
    return params;
  }

  @override
  String toString() {
    return 'CategoryProductsQueryParams{categoryId: $categoryId, order: $order, sortBy: $sortBy, limit: $limit}';
  }
}

