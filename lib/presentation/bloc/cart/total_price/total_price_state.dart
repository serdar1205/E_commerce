part of 'total_price_bloc.dart';

@immutable
abstract class TotalPriceState extends Equatable {
  @override
  List<Object> get props => [];
}

class TotalCostLoadingState extends TotalPriceState {}

class TotalCostLoadedState extends TotalPriceState {
  final double data;

  TotalCostLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class TotalCostErrorState extends TotalPriceState {
  final String message;

  TotalCostErrorState(this.message);

  @override
  List<Object> get props => [message];

}