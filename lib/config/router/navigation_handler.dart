import 'package:flutter/material.dart';
import 'package:memorandum_pt/data/model/model.dart';

abstract class NavigationHandler {
  goHome(BuildContext context);
  goBeerDetails(BuildContext context, Beer beer);
}