import 'package:flutter/material.dart';
import 'package:memorandum_pt/config/dependency_injection/locator.dart';
import 'package:memorandum_pt/presentation/main/my_app.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}
