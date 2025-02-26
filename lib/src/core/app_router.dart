import 'package:go_router/go_router.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/pages/pages.dart';

class AppRouter {
  static late GoRouter router;

  void setupRoutes() {
    router = GoRouter(
      initialLocation: AppRouterPaths.home,
      routes: [
        GoRoute(
          path: AppRouterPaths.home,
          name: AppRoutes.home,
          builder: (context, state) => AccountWellnessInputPage(),
        ),
        GoRoute(
          path: AppRouterPaths.result,
          name: AppRoutes.result,
          builder: (context, state) => AccountWellnessResultPage(
            args: state.extra as AccountWellnessResultPageArguments,
          ),
        ),
      ],
    );
  }
}

class AppRouterPaths {
  static const String home = '/';
  static const String result = '/result';
}

class AppRoutes {
  static const String home = 'home';
  static const String result = 'result';
}
