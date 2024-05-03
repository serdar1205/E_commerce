import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/order/order_preview.dart';
import 'package:tehno_mir/domain/repositories/order_repository.dart';

class GetOrderPreviewUseCase extends BaseUseCase<NoParams, OrderPreviewEntity> {
  final OrderRepository repository;

  GetOrderPreviewUseCase({required this.repository});

  @override
  Future<Either<Failure, OrderPreviewEntity>> execute( input) async {
    return await repository.getOrderPreview();
  }
}


