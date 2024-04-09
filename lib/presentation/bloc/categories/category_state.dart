part of 'category_cubit.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<CategoryEntity> data;

  const CategoryLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class CategoryEmptyState extends CategoryState {
  const CategoryEmptyState();
}

class CategoryErrorState extends CategoryState {
  final String message;

  const CategoryErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
