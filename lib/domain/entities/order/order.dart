import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String paymentType;
  final double productPrice;
  final int deliveryFee;
  final double discount;
  final double totalAmount;
  final String address;
  final DateTime orderDate;

  const OrderEntity({
    required this.paymentType,
    required this.productPrice,
    required this.deliveryFee,
    required this.discount,
    required this.totalAmount,
    required this.address,
    required this.orderDate,
  });

  @override
  List<Object> get props => [
        paymentType,
        productPrice,
        deliveryFee,
        discount,
        totalAmount,
        address,
        orderDate,
      ];
}
