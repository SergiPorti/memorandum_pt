part of 'beer_bloc.dart';

sealed class BeerState extends Equatable {
  const BeerState();

  @override
  List<Object> get props => [];
}

final class BeerInitial extends BeerState {}

final class BeerLoading extends BeerState {}

final class BeerFailure extends BeerState {
  final String message;
  final int errorCode;
  const BeerFailure({required this.message, required this.errorCode});

  @override
  List<Object> get props => [message, errorCode];
}

final class BeerSucces extends BeerState {
  final List<Beer> beers;
  const BeerSucces({required this.beers});

  @override
  List<Object> get props => [beers];
}
