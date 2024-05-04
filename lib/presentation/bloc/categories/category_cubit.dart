import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/category.dart';
import 'package:tehno_mir/domain/usecases/category/categories_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.useCase) : super(CategoryLoadingState());

  GetCategoryUseCase useCase;

  dynamic storedData;


  init(){
    if (storedData != null) {
      emit(CategoryLoadedState(data: storedData));
    }  else{
      getCategories();
    }
  }


  Future<void> getCategories() async {
    final result = await useCase.execute(NoParams());
    result.fold(
      (failure) => {emit(CategoryErrorState(message: failure.message))},
      (data) => {
        if (data.isEmpty){
            emit(const CategoryEmptyState()),
          }else{
          storedData = data,
        emit(CategoryLoadedState(data: data))

    }
      },
    );
  }
}
