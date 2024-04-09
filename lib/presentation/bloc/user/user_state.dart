part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}
class UserLoadedState extends UserState {
  final UserEntity user;

  UserLoadedState(this.user);
}
class UserErrorState extends UserState {
  final String message;

  UserErrorState(this.message);
}
