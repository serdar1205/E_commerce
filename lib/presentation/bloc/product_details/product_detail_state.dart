part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoadedState extends ProductDetailState {
  final ProductDetailEntity data;

  ProductDetailLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class ProductDetailEmptyState extends ProductDetailState {
  ProductDetailEmptyState();
}

class ProductDetailErrorState extends ProductDetailState {
  final String message;

  ProductDetailErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
