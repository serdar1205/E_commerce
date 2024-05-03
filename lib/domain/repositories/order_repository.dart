import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/order/order.dart';
import 'package:tehno_mir/domain/entities/order/order_preview.dart';
import 'package:tehno_mir/domain/usecases/order/order_product.dart';

abstract class OrderRepository{
  Future<Either<Failure, OrderEntity>> orderProduct(OrderProductParams params);
  Future<Either<Failure, List<OrderEntity>>> getOrderedHistory();
  Future<Either<Failure, OrderPreviewEntity>> getOrderPreview();
}