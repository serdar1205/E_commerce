part of 'about_us_cubit.dart';

abstract class AboutUsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AboutUsLoadingState extends AboutUsState {}

class AboutUsLoadedState extends AboutUsState {
  final AboutUsEntity data;

  AboutUsLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class AboutUsEmptyState extends AboutUsState {
  AboutUsEmptyState();
}

class AboutUsErrorState extends AboutUsState {
  final String message;

  AboutUsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
