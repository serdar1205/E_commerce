import 'package:equatable/equatable.dart';

import '../product/product.dart';

class CartItemsEntity extends Equatable {
  final List<Cart> cart;

  const CartItemsEntity({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class Cart extends Equatable {
  final int id;
  final int count;
  final double subTotalPrice;
  final ProductEntity product;

  const Cart({
    required this.id,
    required this.count,
    required this.product,
    required this.subTotalPrice,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "subtotal": subTotalPrice,
    "product": product.toJson(),
  };
  @override
  List<Object> get props => [id, count, product,subTotalPrice];
}
