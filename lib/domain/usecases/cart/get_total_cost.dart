import 'package:dartz/dartz.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/repositories/cart_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';

class GetTotalCostOfCartUseCase extends BaseUseCase<NoParams, double> {
  final CartRepository repository;

  GetTotalCostOfCartUseCase({required this.repository});

  @override
  Future<Either<Failure, double>> execute( input) async {
    return await repository.getTotalCostOfCart();
  }
}