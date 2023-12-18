import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memorandum_pt/config/config.dart' show NavigationHandler;
import 'package:memorandum_pt/data/model/beer/beer.dart';

class MainNavigationHandler implements NavigationHandler {
  @override
  goHome(BuildContext context) async {
    return await GoRouter.of(context).pushReplacement("/");
  }

  @override
  goBeerDetails(BuildContext context, Beer beer) async {
    return await GoRouter.of(context).push("/details", extra: beer);
  }

}