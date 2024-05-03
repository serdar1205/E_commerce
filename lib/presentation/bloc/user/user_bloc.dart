// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:tehno_mir/core/usecase/usecase.dart';
// import 'package:tehno_mir/domain/entities/user.dart';
//
// import '../../../domain/usecases/user/get_user_usecase.dart';
//
// part 'user_event.dart';
// part 'user_state.dart';
//
// class UserBloc extends Bloc<UserEvent, UserState> {
//   final GetUserUseCase useCase;
//   // justtotrade broker for stock
//   //binance crupto valyuta ucin
//
// //acorns
//   //1.webull 2.thinkorswim 3.tradingview
//   //coinbase
//
//   UserBloc(this.useCase) : super(UserLoadingState()) {
//     on<GetUserEvent>(_getUser);
//   }
//
//   void _getUser(GetUserEvent event, Emitter<UserState> emit) async {
//       emit(UserLoadingState());
//       final result = await useCase.execute(NoParams());
//       result.fold(
//               (failure) => {print(failure.toString() + 'blocblocblco'), emit(UserErrorState(failure.message))},
//               (data) => {emit(UserLoadedState(data)),
//             print('_getUser UserLoadedState'),
//           }
//       );
//   }
// }
