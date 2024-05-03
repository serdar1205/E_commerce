import 'package:dartz/dartz.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/repositories/cart_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';

class ClearCartUseCase extends BaseUseCase<NoParams, void> {
  final CartRepository repository;

  ClearCartUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> execute( input) async {
    return await repository.clearCart();
  }
}