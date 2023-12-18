part of 'beer_bloc.dart';

sealed class BeerState extends Equatable {
  const BeerState();
  
  @override
  List<Object> get props => [];
}

final class BeerInitial extends BeerState {}
