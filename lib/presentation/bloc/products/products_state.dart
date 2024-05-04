part of 'products_cubit.dart';

@immutable
abstract class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];

}

class CategoryProductsLoadingState extends CategoryProductsState {}

class CategoryProductsLoadedState extends CategoryProductsState {
  final List<ProductEntity> data;

  const CategoryProductsLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class CategoryProductsEmptyState extends CategoryProductsState {
  const CategoryProductsEmptyState();
}

class CategoryProductsErrorState extends CategoryProductsState {
  final String message;

  const CategoryProductsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
