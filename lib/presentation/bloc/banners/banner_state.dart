part of 'banner_cubit.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerLoadingState extends BannerState {}

class BannerLoadedState extends BannerState {
  final List<BannerEntity> data;

  const BannerLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class BannerEmptyState extends BannerState {
  const BannerEmptyState();

}

class BannerErrorState extends BannerState {
  final String message;

  const BannerErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

