import 'package:memorandum_pt/data/data_provider/beer/beer_provider.dart';
import 'package:memorandum_pt/data/model/model.dart';

class Repository {
  final BeerProvider beerProvider;
  Repository({required this.beerProvider});

  Future<List<Beer>> getBeers() async {
    final res = await beerProvider.getBeers();
    return res.fold(
      (l) => throw Exception(l),
      (r) => r,
    );
  }

  Future<List<Beer>> filterBeers(List<Beer> beers) async {
    return <Beer>[];
  }
}
