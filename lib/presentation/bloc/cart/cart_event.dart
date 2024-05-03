part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCartProductsEvent extends CartEvent {}

// class AddProductEvent extends CartEvent {
//   final CartItemsEntity cartItem;
//
//   AddProductEvent({required this.cartItem});
//
//   @override
//   List<Object> get props => [cartItem];
// }

class UpdateProductEvent extends CartEvent {
  final UpdateCartItemParams params;

  UpdateProductEvent(this.params);

  @override
  List<Object> get props => [params];
}
// class GetCartProductsTotalCostEvent extends CartEvent {}

class RemoveProductEvent extends CartEvent{
  final int productId;

  RemoveProductEvent(this.productId);
  @override
  List<Object> get props => [productId];
}

class ClearCartEvent extends CartEvent {
  ClearCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends CartEvent {
  final int productId;

  AddProductEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
