import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }

  factory KalshiButton.secondary(
      {required String label, VoidCallback? onPressed}) {
    return KalshiButton._(
      label: label,
      backgroundColor: Colors.grey,
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
          backgroundColor: Color.fromRGBO(0, 28, 149, 1),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
