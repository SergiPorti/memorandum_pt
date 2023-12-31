import 'package:go_router/go_router.dart';
import 'package:memorandum_pt/data/model/model.dart';
import 'package:memorandum_pt/presentation/screens.dart';

class MainGoRouter {
  MainGoRouter() {
    _initRouter();
  }

  late GoRouter _router;

  GoRouter get router => _router;

  void _initRouter() {
    _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: "/",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/details",
          builder: (context, state) =>
              BeerDetailsPage(beer: state.extra as Beer),
        ),
      ],
    );
  }
}
