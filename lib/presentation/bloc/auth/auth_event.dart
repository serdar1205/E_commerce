part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInAuthEvent extends AuthEvent {
  final SignInParams params;

  SignInAuthEvent(this.params);
}

class SignUpAuthEvent extends AuthEvent {
  final SignUpParams params;

  SignUpAuthEvent(this.params);
}

class SignOutAuthEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class GetUserEvent extends AuthEvent {

  GetUserEvent();


}
