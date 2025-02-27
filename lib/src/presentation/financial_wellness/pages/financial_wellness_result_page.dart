import 'package:flutter/material.dart';

import '../../../domain/entities/wellness_enum.dart';
import '../../shared/i18n/strings.g.dart';
import '../../shared/shared.dart';
import '../../shared/styles/font_styles.dart';
import '../../shared/styles/spacings.dart';
import '../widgets/score_card.dart';
import '../widgets/security_info.dart';

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
        child: SingleChildScrollView(
          child: Column(
            spacing: Paddings.l,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: Paddings.l),
              const _HeaderText(),
              ScoreCard(status: args.status),
              const SizedBox(height: Paddings.l),
              const SecurityInfo(),
            ],
          ),
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
      padding: EdgeInsets.symmetric(horizontal: Paddings.xxxl),
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
