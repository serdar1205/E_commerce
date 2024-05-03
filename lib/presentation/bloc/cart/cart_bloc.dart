import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/cart/cart_item.dart';
import 'package:tehno_mir/domain/usecases/cart/add_cart_item.dart';
import 'package:tehno_mir/domain/usecases/cart/clear_cart.dart';
import 'package:tehno_mir/domain/usecases/cart/get_total_cost.dart';
import 'package:tehno_mir/domain/usecases/cart/remove_cart_item.dart';
import 'package:tehno_mir/domain/usecases/cart/update_cart_item.dart';
import 'package:tehno_mir/locator.dart';
import 'package:tehno_mir/presentation/bloc/cart/total_price/total_price_bloc.dart';
import '../../../domain/usecases/cart/get_cart_items.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUseCase getItemUseCase;
  final UpdateCartItemUseCase updateUseCase;

//  final GetTotalCostOfCartUseCase totalCostOfCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  final AddCartItemUseCase addCartItemUseCase;
  final Set<int> addedItemId ={};

  CartBloc(
    this.getItemUseCase,
    this.updateUseCase,
    this.removeCartItemUseCase,
    this.clearCartUseCase,
    this.addCartItemUseCase,
  ) : super(CartLoadingState()) {
    on<GetCartProductsEvent>(getCartProducts);
    on<UpdateProductEvent>(updateCartProduct);
    on<RemoveProductEvent>(removeProduct);
    on<ClearCartEvent>(clearCart);
    on<AddProductEvent>(addProduct);
    //on<GetCartProductsTotalCostEvent>(getTotalCostOfCart);
  }

  Future<void> getCartProducts(
    GetCartProductsEvent event,
    Emitter<CartState> emit,
  ) async {
    //  try {
    emit(CartLoadingState());
    final result = await getItemUseCase.execute(NoParams());

    result.fold((failure) => {emit(CartErrorState(failure.message))}, (data) {
      //  print(data.cart.length);
      //  print(data.cart.isEmpty);
      if (data.cart.isEmpty) {
        emit(CartEmptyState());
      } else {
        addedItemId.addAll(data.cart.map((e) => e.product.id));
        print(addedItemId);
        emit(CartLoadedState(data));


      }
    });
    // } catch (error) {
    //   throw error.toString();
    // }
  }

  Future<void>  updateCartProduct(
    UpdateProductEvent event,
    Emitter<CartState> emit,
  ) async {
    //  try {
    emit(CartLoadingState());
    final result = await updateUseCase.execute(event.params);

    result.fold((failure) => {emit(CartErrorState(failure.message))}, (data) {
      //  print(data.cart.length);
      //  print(data.cart.isEmpty);
      if (data.cart.isEmpty) {
        emit(CartEmptyState());
      } else {
        emit(CartLoadedState(data));
      }
    });
    // } catch (error) {
    //   throw error.toString();
    // }
  }

  Future<void> removeProduct(
    RemoveProductEvent event,
    Emitter<CartState> emit,
  ) async {
    //  try {
    emit(CartLoadingState());
    final result = await removeCartItemUseCase.execute(event.productId);

    result.fold((failure) => {emit(CartErrorState(failure.message))}, (data) {
      //  print(data.cart.length);
      print('Items before removed:'+addedItemId.toString());
      addedItemId.remove(event.productId);
      print('Items after removed:'+addedItemId.toString());

      if (data.cart.isEmpty) {
        emit(CartEmptyState());
      } else {
        emit(CartLoadedState(data));
      }
    });
  }
  Future<void> addProduct(
      AddProductEvent event, Emitter<CartState> emit) async {

    final result = await addCartItemUseCase.execute(event.productId);


    result.fold((failure) { emit(CartErrorState(failure.message));
      print('bloc error$failure');

    },
        (data) {
          addedItemId.add(event.productId);
      emit(CartLoadedState(data));

  //   print('bloc success');
    });
  }

  Future<void> clearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    //  try {
    emit(CartLoadingState());
    final result = await clearCartUseCase.execute(NoParams());

    result.fold((failure) => {emit(CartErrorState(failure.message))}, (data) {
      addedItemId.clear();
      emit(CartEmptyState());

    });
  }
}
