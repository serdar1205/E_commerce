part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetOrderPreviewEvent extends OrderEvent {}

class GetOrderHistoryEvent extends OrderEvent {


}

class OrderProductEvent extends OrderEvent {
  final OrderProductParams orderProductParams;

  OrderProductEvent(this.orderProductParams);

  @override
  List<Object> get props => [orderProductParams];
}
