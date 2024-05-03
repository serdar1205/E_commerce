part of 'auth_bloc.dart';

abstract class AuthState extends Equatable{}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogged extends AuthState {
  AuthLogged(this.data);
   final UserEntity? data;
  @override
  List<Object?> get props => [];
}
class AuthNotLogged extends AuthState {
  AuthNotLogged();


  @override
  List<Object?> get props => [];
}


class AuthLoggedFail extends AuthState {
  final String message;
  AuthLoggedFail(this.message);
  @override
  List<Object> get props => [message];
}

class AuthLoggedOut extends AuthState {
  @override
  List<Object> get props => [];
}


class UserLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}
class UserLoadedState extends AuthState {
  final UserEntity user;

  UserLoadedState(this.user);
  @override
  List<Object?> get props => [user];
}
class UserErrorState extends AuthState {
  final String message;

  UserErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

