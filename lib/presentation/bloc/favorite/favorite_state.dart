part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductEntity> data;

  FavoriteLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}

class FavoriteEmpty extends FavoriteState {}
