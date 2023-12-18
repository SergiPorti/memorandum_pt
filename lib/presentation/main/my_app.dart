import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memorandum_pt/config/config.dart' show MainGoRouter;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = MainGoRouter().router;

    return MaterialApp.router(
      title: 'Prueba tecnica Memorandum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
