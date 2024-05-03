import 'package:tehno_mir/domain/entities/order/order_preview.dart';

class OrderPreviewModel extends OrderPreviewEntity {
  const OrderPreviewModel(
      {required super.productPrice,
      required super.deliveryFee,
      required super.discount,
      required super.totalAmount});

  factory OrderPreviewModel.fromJson(Map<String, dynamic> json) =>
      OrderPreviewModel(
        productPrice: json["product_price"],
        deliveryFee: json["delivery_fee"],
        discount: json["discount"],
        totalAmount: json["total_amount"],
      );

  Map<String, dynamic> toJson() => {
        "product_price": productPrice,
        "delivery_fee": deliveryFee,
        "discount": discount,
        "total_amount": totalAmount,
      };
}
