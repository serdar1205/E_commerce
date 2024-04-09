part of 'products_cubit.dart';

@immutable
abstract class CategoryProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryProductsLoadingState extends CategoryProductsState {}

class CategoryProductsLoadedState extends CategoryProductsState {
  final List<ProductEntity> data;

  CategoryProductsLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class CategoryProductsEmptyState extends CategoryProductsState {
  CategoryProductsEmptyState();
}

class CategoryProductsErrorState extends CategoryProductsState {
  final String message;

  CategoryProductsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
