import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tehno_mir/domain/usecases/products/get_product_usecase.dart';
import 'package:tehno_mir/domain/usecases/products/get_category_products_usecase.dart';
import '../../../domain/entities/product/product.dart';
import '../../../domain/usecases/products/get_search_result.dart';
part 'products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(
      this.categoryProductsUseCase, this.searchResultUseCase, this.productUseCase)
      : super(CategoryProductsLoadingState());

  final GetCategoryProductsUseCase categoryProductsUseCase;

  //final GetAllProductsUseCase allProductsUseCase;
  final GetSearchResultUseCase searchResultUseCase;

  final GetProductUseCase productUseCase;

  final TextEditingController searchController = TextEditingController();
  final List<String> values = ["created_at", "asc", "desc"];
  String? selectedValue = 'created_at';


  dynamic storedData;


  init(){
    if (storedData != null) {
      emit(CategoryProductsLoadedState(data: storedData));
    }  else{
      getProducts(ProductQueryParameters());
    }
  }



  void updateSelectedValue(String? value) {
    selectedValue = value;
  }


  Future<void> getCategoryProducts(
      CategoryProductsQueryParams params) async {
    final result =
        await categoryProductsUseCase.execute(CategoryProductsQueryParams(
      categoryId: params.categoryId,
      order: params.order,
      sortBy: params.sortBy,
      limit: params.limit,
    ));


    result.fold(
        (failure) =>
            emit(CategoryProductsErrorState(message: failure.message)),
        (data) => {
              if (data.isEmpty)
                {
                  emit(CategoryProductsEmptyState()),
                },
              emit(CategoryProductsLoadedState(data: data)),
            });
  }

  // Future<void> getAllProducts() async {
  //   final result = await allProductsUseCase.execute(NoParams());
  //
  //   result.fold(
  //           (failure) => {
  //         emit(CategoryProductsErrorState(message: failure.message))
  //       },
  //           (data) => {
  //         if (data.isEmpty){
  //           emit(CategoryProductsEmptyState()),
  //         },
  //         emit(CategoryProductsLoadedState(data: data)),
  //       });
  // }

  Future<void> getSearchedProducts(String keyword) async {
    emit(CategoryProductsLoadingState());
    final result = await searchResultUseCase
        .execute(ParamsGetSearchResultUseCase(keyword: keyword));

    result.fold(
        (failure) =>
            {emit(CategoryProductsErrorState(message: failure.message))},
        (data) => {
              if (data.isEmpty)
                {
                  emit(CategoryProductsEmptyState()),
                },
              emit(CategoryProductsLoadedState(data: data)),
            });
  }

  Future<void> getProducts(ProductQueryParameters params) async {
    emit(CategoryProductsLoadingState());
    final result = await productUseCase.execute(ProductQueryParameters(
        order: params.order, sortBy: params.sortBy, limit: params.limit));

    result.fold(
        (failure) =>
            emit(CategoryProductsErrorState(message: failure.message)),
        (data) => {
              if (data.isEmpty){
                  emit(const CategoryProductsEmptyState()),
                }
          else{
            storedData = data,
    emit(CategoryProductsLoadedState(data: data)),
    }});
  }


}
