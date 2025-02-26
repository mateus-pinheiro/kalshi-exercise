import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/account_wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_appbar.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/widgets/score_card.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/widgets/security_info.dart';

class AccountWellnessResultPageArguments {
  final AccountWellnessStatus status;

  AccountWellnessResultPageArguments({required this.status});
}

class AccountWellnessResultPage extends StatelessWidget {
  final AccountWellnessResultPageArguments args;

  const AccountWellnessResultPage({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KalshiAppbar(),
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const _HeaderText(),
            const SizedBox(height: 20),
            ScoreCard(status: args.status),
            const SizedBox(height: 40),
            const SecurityInfo(),
          ],
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text.rich(
        TextSpan(
          text: "Here's your ",
          style: TextStyle(fontSize: 20, color: Colors.black54),
          children: [
            TextSpan(
              text: "financial wellness score.",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
