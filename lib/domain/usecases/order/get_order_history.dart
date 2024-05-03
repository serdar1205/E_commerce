import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/order/order.dart';
import 'package:tehno_mir/domain/repositories/order_repository.dart';

class GetOrderHistoryUseCase extends BaseUseCase<NoParams, List<OrderEntity>> {
  final OrderRepository repository;

  GetOrderHistoryUseCase({required this.repository});

  @override
  Future<Either<Failure, List<OrderEntity>>> execute( input) async {
    return await repository.getOrderedHistory();
  }
}

