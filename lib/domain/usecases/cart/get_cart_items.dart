import 'package:dartz/dartz.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/repositories/cart_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';

class GetCartItemsUseCase extends BaseUseCase<NoParams, CartItemsEntity> {
  final CartRepository repository;

  GetCartItemsUseCase({required this.repository});

  @override
  Future<Either<Failure, CartItemsEntity>> execute( input) async {
    return await repository.getCartItems();
  }
}