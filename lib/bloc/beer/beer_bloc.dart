import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'beer_event.dart';
part 'beer_state.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  BeerBloc() : super(BeerInitial()) {
    on<BeerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
