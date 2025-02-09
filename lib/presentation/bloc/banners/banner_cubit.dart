import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/banners.dart';
import '../../../domain/usecases/banner/banner.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final GetBannerUseCase useCase;

  BannerCubit(this.useCase) : super(BannerLoadingState());

  dynamic storedData;

  init() {
    if (storedData != null) {
      emit(BannerLoadedState(data: storedData));
    } else {
      getBanners();
    }
  }

  Future<void> getBanners() async {
    final result = await useCase.execute(NoParams());
    result.fold(
      (failure) => {
        emit(BannerErrorState(message: failure.message)),
      },
      (success) => {
        if (success.isEmpty)
          {
            emit(const BannerEmptyState()),
          }
        else
          {storedData = success, emit(BannerLoadedState(data: success))}
      },
    );
  }
}
