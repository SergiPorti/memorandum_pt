import 'package:dartz/dartz.dart';
import 'package:memorandum_pt/data/model/model.dart';

abstract class BeerProviderInterface {
  Future<Either<Failure, List<Beer>>> getBeers();
  Future<List<Beer>> filterBeers(List<Beer> beers);
}
