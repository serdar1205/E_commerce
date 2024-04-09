part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductDetailEvent extends ProductDetailEvent {
  final ParamsGetProductDetailUseCase params;

  GetProductDetailEvent(this.params);

  @override
  List<Object> get props => [params];
}
