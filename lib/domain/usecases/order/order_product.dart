import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/order/order.dart';
import 'package:tehno_mir/domain/repositories/order_repository.dart';

class OrderProductCase extends BaseUseCase<OrderProductParams, OrderEntity> {
  final OrderRepository repository;

  OrderProductCase({required this.repository});

  @override
  Future<Either<Failure, OrderEntity>> execute(input) async {
    return await repository.orderProduct(input);
  }
}

class OrderProductParams extends Equatable {
  final String paymentType;
  final double productPrice;
  final int deliveryFee;
  final double discount;
  final double totalAmount;
  final String address;
  final DateTime orderDate;

  const OrderProductParams({
    required this.paymentType, required this.productPrice, required this.deliveryFee,
    required this.discount, required this.totalAmount, required this.address,
    required this.orderDate,
  });


  @override
  List<Object> get props =>
      [
        paymentType,
        productPrice,
        deliveryFee,
        discount,
        totalAmount,
        address,
        orderDate,
      ];

  @override
  String toString() {
    return 'OrderProductParams{paymentType: $paymentType, productPrice: $productPrice, deliveryFee: $deliveryFee, discount: $discount, totalAmount: $totalAmount, address: $address, orderDate: $orderDate}';
  }


}