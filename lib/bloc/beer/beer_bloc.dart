import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:memorandum_pt/data/data.dart';
import 'package:memorandum_pt/data/model/model.dart';

part 'beer_event.dart';
part 'beer_state.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final Repository repository;
  BeerBloc({required this.repository}) : super(BeerInitial()) {
    on<GetBeersEvent>((event, emit) async {
      debugPrint('Getting Beers');
      emit(BeerLoading());
      try {
        final List<Beer> beers = await repository.getBeers();
        emit(BeerSucces(beers: beers));
      } catch ($e) {
        emit(BeerFailure(message: $e.toString(), errorCode: $e.hashCode));
      }
    });
    on<FilterBeersEvent>((event, emit) async {
      
    });
  }
}
