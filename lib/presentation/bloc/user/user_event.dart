part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {

  GetUserEvent();

  @override
  List<Object> get props => [];

}