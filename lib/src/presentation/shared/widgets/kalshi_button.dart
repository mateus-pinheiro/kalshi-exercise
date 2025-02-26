import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/presentation/shared/styles/font_styles.dart';

enum KalshiButtonType { primary, secondary }

class KalshiButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const KalshiButton._({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
  });

  factory KalshiButton.primary(
      {required String label, VoidCallback? onPressed}) {
    return KalshiButton._(
      label: label,
      backgroundColor: Color.fromRGBO(0, 28, 149, 1),
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }

  factory KalshiButton.secondary(
      {required String label, VoidCallback? onPressed}) {
    return KalshiButton._(
      label: label,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("Continue",
              style: FontStyles.button.copyWith(color: textColor)),
        ),
      ),
    );
  }
}
