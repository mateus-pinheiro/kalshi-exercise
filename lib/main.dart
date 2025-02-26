import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/core/app_router.dart';
import 'package:kalshi_exercise/src/core/di.dart';

void main() {
  setup();
  runApp(const KalshiApp());
}

void setup() {
  registerDependencies();
  AppRouter().setupRoutes();
}

class KalshiApp extends StatelessWidget {
  const KalshiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kalshi Exercise',
      routerConfig: AppRouter.router,
    );
  }
}
