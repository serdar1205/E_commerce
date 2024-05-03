import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/repositories/cart_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';

class UpdateCartItemUseCase extends BaseUseCase<UpdateCartItemParams, CartItemsEntity> {
  final CartRepository repository;

  UpdateCartItemUseCase({required this.repository});

  @override
  Future<Either<Failure, CartItemsEntity>> execute( input) async {
    return await repository.updateCartItems(input);
  }
}

class UpdateCartItemParams extends Equatable {
  final int productId;
  final int count;

  const UpdateCartItemParams({required this.productId, required this.count});

  @override
  List<Object> get props => [productId, count];

  @override
  String toString() {
    return 'UpdateCartItemParams{productId: $productId, count: $count}';
  }
}