part of 'beer_bloc.dart';

sealed class BeerEvent extends Equatable {
  const BeerEvent();

  @override
  List<Object> get props => [];
}

final class GetBeersEvent extends BeerEvent {}
final class FilterBeersEvent extends BeerEvent {}
