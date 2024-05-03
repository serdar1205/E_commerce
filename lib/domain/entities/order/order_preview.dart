import 'package:equatable/equatable.dart';

class OrderPreviewEntity extends Equatable {
  final double productPrice;
  final int deliveryFee;
  final double discount;
  final double totalAmount;

  const OrderPreviewEntity({
    required this.productPrice,
    required this.deliveryFee,
    required this.discount,
    required this.totalAmount,
  });

  @override
  List<Object> get props => [
        productPrice,
        deliveryFee,
        discount,
        totalAmount,
      ];
}
