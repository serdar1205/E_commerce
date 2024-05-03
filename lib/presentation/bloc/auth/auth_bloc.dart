import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/core/local/token_store.dart';
import 'package:tehno_mir/domain/entities/user.dart';
import 'package:tehno_mir/locator.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';
import '../../../core/usecase/usecase.dart';
import '../../../domain/usecases/user/get_user_usecase.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/sign_out_usecase.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetUserUseCase useCase;

  AuthBloc(this._signInUseCase, this._signUpUseCase, this._signOutUseCase,
      this.useCase)
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
          (failure) => {
                print(failure.toString() + 'blocblocblco'),
                emit(AuthLoggedFail(failure.message))
              },
          (data) => {
                emit(AuthLogged(data)),
                //   locator<UserBloc>().add(GetUserEvent()),
                print('_onSignIn UserLogged'),
              });
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
        (data) => {
          emit(AuthLogged(data)),
          print('_onSignUp UserLogged'),
        },
      );
    } catch (e) {
      emit(AuthLoggedFail(e.toString()));
    }
  }

  Future<void> _signOut(SignOutAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      var refreshToken = await Store.getRefreshToken();
      final result = await _signOutUseCase.execute(refreshToken ?? '');
      result.fold(
          (failure) => {
                print('Bloc sign out failed\n'),
                print(failure.message),
              },
          (data) => {
                print("Bloc Logged out successfully !!!!!!!!!!!!!!!"),
                emit(AuthLoggedOut()),
                Store.clear(),
              });
    } catch (e) {
      emit(AuthLoggedFail(e.toString()));
    }
  }

  FutureOr<void> _onCheckUser(
      CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await Store.isTokenAvailable();

    if (result) {
      final userData = await useCase.execute(NoParams());
      userData.fold(
          (failure) => {
                print(failure.toString() + 'blocblocblco'),
                emit(UserErrorState(failure.message)),
              },
          (data) => {
                emit(AuthLogged(data)),

                print('_getUser UserLoadedState'),
              });

      //  locator<UserBloc>().add(GetUserEvent());
      print('_onCheckUser UserLogged');
    } else {
      emit(AuthNotLogged());
    }
  }
}
