import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tehno_mir/domain/usecases/product_detail/get_product_detail.dart';

import '../../../domain/entities/product_detail.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUseCase useCase;

  ProductDetailBloc(this.useCase) : super(ProductDetailLoading()) {
    on<GetProductDetailEvent>(getProductDetail);
  }

  Future<void> getProductDetail(
    GetProductDetailEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
  //  try {
    emit(ProductDetailLoading());
      final result = await useCase.execute(event.params);

      result.fold(
          (failure) => {
            emit(ProductDetailErrorState(message: failure.message))},
          (data) => {
                if (data == null){
                    emit(ProductDetailEmptyState()),
                  },
                emit(ProductDetailLoadedState(data: data)),
              });
    // } catch (error) {
    //   throw error.toString();
    // }
  }
}
