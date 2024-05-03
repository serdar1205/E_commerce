part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final CartItemsEntity data;

  CartLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class CartEmptyState extends CartState {}

class CartErrorState extends CartState {
  final String message;

  CartErrorState(this.message);

  @override
  List<Object> get props => [message];

}
class CartItemUpdatedState extends CartState {
  final CartItemsEntity data;

  CartItemUpdatedState(this.data);

  @override
  List<Object> get props => [data];
}

