import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:memorandum_pt/data/data_provider/beer/beer_provider_interface.dart';
import 'package:memorandum_pt/data/model/model.dart';
import 'package:memorandum_pt/environment.dart';

class BeerProvider implements BeerProviderInterface {
  @override
  Future<Either<Failure, List<Beer>>> getBeers() async {
    final Uri url = Uri.parse('$apiUrl/beers');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      try {
        List<Beer> beers = [];
        final json = jsonDecode(res.body);
        beers.addAll(json.map<Beer>((item) => Beer.fromJson(item)).toList());

        return Right(beers);
      } catch ($e) {
        return Left(Failure(message: $e.toString(), errorCode: res.statusCode));
      }
    }
    return Left(Failure(message: "Server Error", errorCode: res.statusCode));
  }

  @override
  Future<List<Beer>> filterBeers(List<Beer> beers) async {
    return <Beer>[];
  }
}
