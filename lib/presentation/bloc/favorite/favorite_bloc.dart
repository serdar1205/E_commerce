import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import 'package:tehno_mir/domain/usecases/favorite/add_favorite.dart';
import 'package:tehno_mir/domain/usecases/favorite/get_favorite.dart';
import 'package:tehno_mir/domain/usecases/favorite/remove_favorite.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteUseCase getFavoriteUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  final Set<int> productId = {};

  FavoriteBloc(this.getFavoriteUseCase, this.addFavoriteUseCase,
      this.removeFavoriteUseCase)
      : super(FavoriteInitial()) {
    on<GetFavoriteProducts>(getFavoriteProduct);
    on<AddFavoriteProduct>(addFavoriteProduct);
    on<RemoveFavoriteProduct>(removeFavoriteProduct);
  }

  Future<void> getFavoriteProduct(
    GetFavoriteProducts event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoading());

    final result = await getFavoriteUseCase.execute(NoParams());

    result.fold(
        (failure) =>
            {emit(FavoriteError(failure.message)), print(failure.message)},
        (data) => {
              if (data.isEmpty)
                {
                  emit(FavoriteEmpty()),
                }
              else
                {
                  productId.addAll(data.map((e) => e.id)),
                  emit(FavoriteLoaded(data)),
                  print(data)
                }
            });
  }

  Future<void> addFavoriteProduct(
    AddFavoriteProduct event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await addFavoriteUseCase.execute(event.productId);

    result.fold(
        (failure) =>
            {emit(FavoriteError(failure.message)), print(failure.message)},
        (data) => {
              productId.add(event.productId),
              emit(FavoriteLoaded(data)),
              print(data)
            });
  }

  Future<void> removeFavoriteProduct(
    RemoveFavoriteProduct event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await removeFavoriteUseCase.execute(event.productId);

    result.fold(
        (failure) =>
            {emit(FavoriteError(failure.message)), print(failure.message)},
        (data) => {

          productId.remove(event.productId),
          print('Removed bloc'),
        emit(FavoriteLoaded(data)),
          if (data.isEmpty) {
            emit(FavoriteEmpty()),
          }
        });
  }
}
