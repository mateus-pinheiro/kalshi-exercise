import 'package:flutter/material.dart';
import 'package:kalshi_exercise/core/di.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  registerDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // wellness();
    return Container();
  }
}
