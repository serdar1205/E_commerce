import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/local/token_store.dart';
import 'package:tehno_mir/domain/entities/user.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/sign_out_usecase.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';
import '../../../locator.dart';
import '../user/user_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthBloc(this._signInUseCase, this._signUpUseCase, this._signOutUseCase)
      : super(AuthInitial()) {
    on<SignInAuthEvent>(_onSignIn);
    on<SignUpAuthEvent>(_onSignUp);
    on<CheckAuthEvent>(_onCheckUser);
    on<SignOutAuthEvent>(_signOut);
  }

  void _onSignIn(SignInAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final result = await _signInUseCase.execute(event.params);
      result.fold(
        (failure) => {print(failure.toString() + 'blocblocblco'), emit(AuthLoggedFail(failure.message))},
        (data) => {emit(AuthLogged()),
        locator<UserBloc>().add(GetUserEvent()),
        print('_onSignIn UserLogged'),
        }

      );
    } catch (e) {
      emit(AuthLoggedFail(e.toString()));
    }
  }

  FutureOr<void> _onSignUp(
      SignUpAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final result = await _signUpUseCase.execute(event.params);
      result.fold(
        (failure) => {
          print(failure.toString() + 'blocblocblco'),
          emit(AuthLoggedFail(failure.message))
        },
        (data) => {emit(AuthLogged()),
          print('_onSignUp UserLogged'),
        },
      );
    } catch (e) {
      emit(AuthLoggedFail(e.toString()));
    }
  }

  Future<void> _signOut(   SignOutAuthEvent event, Emitter<AuthState> emit)async{
    try{
      emit(AuthLoading());
      var refreshToken = await Store.getRefreshToken();
      final result = await _signOutUseCase.execute(refreshToken ?? '');
      result.fold((failure) => {
        print('Bloc sign out failed\n'),
        print(failure.message),
      }, (data) =>{
        print("Bloc Logged out successfully !!!!!!!!!!!!!!!"),
        emit(AuthLoggedOut()),
        Store.clear(),
      }
      );
    }catch(e){
      emit(AuthLoggedFail(e.toString()));
    }
  }

  FutureOr<void> _onCheckUser(
      CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await Store.isTokenAvailable();
    if (result) {
      emit(AuthLogged());
     locator<UserBloc>().add(GetUserEvent());
      print('_onCheckUser UserLogged');
    }else{
      emit(AuthNotLogged());
    }
  }
}
