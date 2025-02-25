import 'package:flutter/material.dart';
import 'package:kalshi_exercise/core/di.dart';
import 'package:kalshi_exercise/presentation/pages/account_wellness_input_page.dart';

void main() {
  setup();
  runApp(const AccountWellnessInputPage());
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
