import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/account_wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/account_wellness/extensions/account_wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';
import 'package:kalshi_exercise/src/presentation/shared/widgets/kalshi_button.dart';
import 'progress_indicator_bar.dart';

class ScoreCard extends StatelessWidget {
  final AccountWellnessStatus status;

  const ScoreCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey.withValues(alpha: 0.3),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(radius: 30, backgroundColor: Colors.black),
              const SizedBox(height: 20),
              ProgressIndicatorBar(status: status),
              const SizedBox(height: 20),
              Text(
                status.description,
                style: FontStyles.title,
              ),
              const SizedBox(height: 5),
              Text.rich(
                TextSpan(
                  text: "Your financial wellness score is ",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                  children: [
                    TextSpan(
                      text: status.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              KalshiButton.secondary(label: 'Return'),
            ],
          ),
        ),
      ),
    );
  }
}
