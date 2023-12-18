import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:memorandum_pt/bloc/beer/beer_bloc.dart';
import 'package:memorandum_pt/config/config.dart' show MainGoRouter;
import 'package:memorandum_pt/config/dependency_injection/locator.dart';
import 'package:memorandum_pt/data/data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = MainGoRouter().router;

    return BlocProvider<BeerBloc>(
      create: (context) => BeerBloc(repository: locator<Repository>())..add(GetBeersEvent()),
      child: MaterialApp.router(
        title: 'Prueba tecnica Memorandum',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
