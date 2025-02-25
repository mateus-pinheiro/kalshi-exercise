import 'package:flutter/material.dart';
import 'package:kalshi_exercise/presentation/widgets/kalshi_appbar.dart';

class AccountWellnessResultPage extends StatelessWidget {
  const AccountWellnessResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KalshiAppbar(),
      body: _AccountWellnessResultBody(),
    );
  }
}

class _AccountWellnessResultBody extends StatelessWidget {
  const _AccountWellnessResultBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Account Wellness Result Page'),
    );
  }
}
