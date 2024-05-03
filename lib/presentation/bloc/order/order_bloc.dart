import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/order/order.dart';
import 'package:tehno_mir/domain/entities/order/order_preview.dart';
import 'package:tehno_mir/domain/usecases/order/get_order_history.dart';
import 'package:tehno_mir/domain/usecases/order/get_order_preview.dart';
import 'package:tehno_mir/domain/usecases/order/order_product.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  GetOrderHistoryUseCase getOrderHistoryUseCase;
  GetOrderPreviewUseCase previewUseCase;
  OrderProductCase orderProductCase;

  OrderBloc(
      this.orderProductCase, this.previewUseCase, this.getOrderHistoryUseCase)
      : super(OrderInitial()) {
    on<OrderProductEvent>(orderProduct);
    on<GetOrderHistoryEvent>(getOrderedHistory);
    on<GetOrderPreviewEvent>(getOrderPreview);
  }

  Future<void> orderProduct(
    OrderProductEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoadingState());

    final result = await orderProductCase.execute(event.orderProductParams);

    result.fold((failure) => emit(OrderErrorState(failure.message)),
        (data) => emit(OrderLoadedState(data)));
  }

  Future<void> getOrderedHistory(
    GetOrderHistoryEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderHistoryLoadingState());

    final result = await getOrderHistoryUseCase.execute(NoParams());

    result.fold((failure) => {emit(OrderHistoryErrorState(failure.message)),print(failure.message)},
        (data) => {emit(OrderHistoryLoadedState(data)), print(data)});
  }

  Future<void> getOrderPreview(
    GetOrderPreviewEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderPreviewLoadingState());

    final result = await previewUseCase.execute(NoParams());

    result.fold((failure) => emit(OrderPreviewErrorState(failure.message)),
        (data) => emit(OrderPreviewLoadedState(data)));
  }
}
