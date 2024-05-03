import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tehno_mir/domain/usecases/cart/get_total_cost.dart';

import '../../../../core/usecase/usecase.dart';

part 'total_price_event.dart';
part 'total_price_state.dart';

class TotalPriceBloc extends Bloc<TotalPriceEvent, TotalPriceState> {
  final GetTotalCostOfCartUseCase totalCostOfCartUseCase;

  TotalPriceBloc(this.totalCostOfCartUseCase) : super(TotalCostLoadingState()) {
    on<GetCartProductsTotalCostEvent>(getTotalCostOfCart);
  }
  Future<void> getTotalCostOfCart(
      GetCartProductsTotalCostEvent event,
      Emitter<TotalPriceState> emit,
      ) async {
    //  try {
    emit(TotalCostLoadingState());
    final result = await totalCostOfCartUseCase.execute(NoParams());

    result.fold((failure) => {emit(TotalCostErrorState(failure.message)),
      // print(failure.message)
    }, (data) {

      //
      //  print(data.cart.isEmpty);

      emit(TotalCostLoadedState(data));
      // print(data);
      // print(state);

    });
    // } catch (error) {
    //   throw error.toString();
    // }
  }
}
