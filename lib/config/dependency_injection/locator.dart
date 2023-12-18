import 'package:get_it/get_it.dart';
import 'package:memorandum_pt/config/config.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationHandler>(() => MainNavigationHandler());
}