part of 'total_price_bloc.dart';

@immutable
abstract class TotalPriceEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetCartProductsTotalCostEvent extends TotalPriceEvent {}
