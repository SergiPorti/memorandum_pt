import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memorandum_pt/config/config.dart' show NavigationHandler;

class MainNavigationHandler implements NavigationHandler {
  @override
  goHome(BuildContext context) async {
    return await GoRouter.of(context).pushReplacement("/");
  }

}