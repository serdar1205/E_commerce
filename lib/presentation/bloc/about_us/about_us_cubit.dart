import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tehno_mir/domain/entities/about_us.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/usecases/about_us/about_us_usecase.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final GetAboutUsUseCase useCase;

  AboutUsCubit(this.useCase) : super(AboutUsLoadingState());

  Future<void> getShopInfo() async {
    emit(AboutUsLoadingState());

    final result = await useCase.execute(NoParams());
    result.fold(
      (failure) => {
        emit(AboutUsErrorState(message: failure.message)),
      },
      (success) => {
        if (success == null){
            emit(AboutUsEmptyState()),
          },
        emit(AboutUsLoadedState(data: success))
      },
    );
  }
}
