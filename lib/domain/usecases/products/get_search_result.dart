import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/repositories/product.dart';

class GetSearchResultUseCase extends BaseUseCase<ParamsGetSearchResultUseCase, List<ProductEntity>>{

  final ProductsRepository repository;

  GetSearchResultUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> execute(ParamsGetSearchResultUseCase input) async{
    return await repository.getSearchResult(input.keyword);
  }
}
class ParamsGetSearchResultUseCase extends Equatable {
  final String keyword;

  const ParamsGetSearchResultUseCase({required this.keyword});

  @override
  List<Object> get props => [keyword];

  @override
  String toString() {
    return 'ParamsGetSearchResultUseCase Params{keyword: $keyword}';
  }
}