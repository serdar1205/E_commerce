part of 'order_bloc.dart';

@immutable
abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}
class OrderInitial extends OrderState {}

class OrderPreviewLoadingState extends OrderState {}

class OrderPreviewLoadedState extends OrderState {
  final OrderPreviewEntity data;

  OrderPreviewLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class OrderPreviewErrorState extends OrderState {
  final String message;

  OrderPreviewErrorState(this.message);

  @override
  List<Object> get props => [message];
}

///
class OrderHistoryLoadingState extends OrderState {}

class OrderHistoryLoadedState extends OrderState {
  final List<OrderEntity> data;

  OrderHistoryLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class OrderHistoryErrorState extends OrderState {
  final String message;

  OrderHistoryErrorState(this.message);

  @override
  List<Object> get props => [message];
}



///

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final OrderEntity data;

  OrderLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class OrderErrorState extends OrderState {
  final String message;

  OrderErrorState(this.message);

  @override
  List<Object> get props => [message];
}
