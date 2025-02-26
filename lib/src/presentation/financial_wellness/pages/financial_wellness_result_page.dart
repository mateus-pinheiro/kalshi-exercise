import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/shared/i18n/strings.g.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_appbar.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/widgets/score_card.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/widgets/security_info.dart';

class AccountWellnessResultPageArguments {
  final FinancialWellnessStatus status;

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
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const _HeaderText(),
            ScoreCard(status: args.status),
            const SizedBox(height: 20),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text.rich(
        t.financialWellnessResultPage.title(
          bold: (text) => TextSpan(
            text: text,
            style: FontStyles.titleBold,
          ),
        ),
        textAlign: TextAlign.center,
        style: FontStyles.title,
      ),
    );
  }
}
