import 'package:get_it/get_it.dart';
import 'package:memorandum_pt/config/config.dart';
import 'package:memorandum_pt/data/data.dart';
import 'package:memorandum_pt/data/data_provider/beer/beer_provider.dart';
import 'package:memorandum_pt/data/data_provider/beer/beer_provider_interface.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerLazySingleton<NavigationHandler>(() => MainNavigationHandler());
  locator.registerFactory<BeerProvider>(() => BeerProvider());
  locator.registerLazySingleton<Repository>(
    () => Repository(beerProvider: locator<BeerProvider>()),
  );
}
