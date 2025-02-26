import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/shared/i18n/strings.g.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_button.dart';
import 'progress_indicator_bar.dart';

class ScoreCard extends StatelessWidget {
  final FinancialWellnessStatus status;

  const ScoreCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey.withValues(alpha: 0.3),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SvgPicture.asset("assets/images/logo-image.svg"),
              const SizedBox(height: 20),
              ProgressIndicatorBar(status: status),
              const SizedBox(height: 24),
              Text(
                t.financialWellnessEnum
                    .description(financialWellnessStatus: status),
                style: FontStyles.cardTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text.rich(
                t.financialWellnessResultPage.form.description(
                  bold: (_) => TextSpan(
                    text: t.financialWellnessEnum.text(financialWellnessStatus: status),
                    style: FontStyles.cardDescriptionBold,
                  ),
                ),
                textAlign: TextAlign.center,
                style: FontStyles.cardDescription,
              ),
              const SizedBox(height: 32),
              KalshiButton.secondary(
                label: t.financialWellnessResultPage.form.button,
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
