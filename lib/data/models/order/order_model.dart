import 'package:tehno_mir/domain/entities/order/order.dart';

class OrderModel extends OrderEntity {
  const OrderModel(
      {required super.paymentType,
      required super.productPrice,
      required super.deliveryFee,
      required super.discount,
      required super.totalAmount,
      required super.address,
      required super.orderDate});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        paymentType: json["payment_type"],
        productPrice: json["product_price"],
        deliveryFee: json["delivery_fee"],
        discount: json["discount"],
        totalAmount: json["total_amount"],
        address: json["address"],
        orderDate: DateTime.parse(json["order_date"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_type": paymentType,
        "product_price": productPrice,
        "delivery_fee": deliveryFee,
        "discount": discount,
        "total_amount": totalAmount,
        "address": address,
        "order_date": orderDate.toIso8601String(),
      };
}
