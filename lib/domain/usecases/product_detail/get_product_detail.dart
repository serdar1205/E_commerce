import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product_detail.dart';
import 'package:tehno_mir/domain/repositories/product_detail_repository.dart';

class GetProductDetailUseCase extends BaseUseCase<ParamsGetProductDetailUseCase,
    ProductDetailEntity> {
  final ProductDetailRepository repository;

  GetProductDetailUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductDetailEntity>> execute(
      ParamsGetProductDetailUseCase input) async {
    return await repository.getProductDetails(input.productId);
  }
}

class ParamsGetProductDetailUseCase extends Equatable {
  final int productId;

  const ParamsGetProductDetailUseCase({required this.productId});

  @override
  List<Object> get props => [productId];

  @override
  String toString() {
    return 'ParamsGetProductDetailUseCase Params{productId: $productId}';
  }
}
