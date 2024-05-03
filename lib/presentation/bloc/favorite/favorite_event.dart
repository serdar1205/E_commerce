part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFavoriteProducts extends FavoriteEvent {}

class AddFavoriteProduct extends FavoriteEvent {
  final int productId;

  AddFavoriteProduct(this.productId);

  @override
  List<Object> get props => [productId];
}

class RemoveFavoriteProduct extends FavoriteEvent {
  final int productId;

  RemoveFavoriteProduct(this.productId);

  @override
  List<Object> get props => [productId];
}
