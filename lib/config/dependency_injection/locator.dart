import 'package:get_it/get_it.dart';
import 'package:memorandum_pt/config/config.dart';
import 'package:memorandum_pt/data/data.dart';
import 'package:memorandum_pt/data/data_provider/beer/beer_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerLazySingleton<NavigationHandler>(() => MainNavigationHandler());
  locator.registerSingleton<BeerProvider>(BeerProvider());
  locator.registerLazySingleton<Repository>(
    () => Repository(beerProvider: locator<BeerProvider>()),
  );
}
