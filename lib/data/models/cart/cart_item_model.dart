import 'package:tehno_mir/data/models/product/products_model.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';

class CartItemModel extends CartItemsEntity {
  const CartItemModel({required super.cart});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        cart: List<CartModel>.from(
            json["cart"].map((x) => CartModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class CartModel extends Cart {
  const CartModel({
    required super.id,
    required super.count,
    required super.product,
    required super.subTotalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        count: json["count"],
    subTotalPrice: json["subtotal"],
        product: ProductsModel.fromJson(json["product"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "count": count,
  //       "product": product.toJson(),
  //     };
}
