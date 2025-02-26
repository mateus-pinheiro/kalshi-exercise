import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';

extension FinancialWellnessStatusExtension on FinancialWellnessStatus {
  Color get color {
    switch (this) {
      case FinancialWellnessStatus.healthy:
        return Colors.green;
      case FinancialWellnessStatus.medium:
        return Colors.orange;
      case FinancialWellnessStatus.low:
        return Colors.red;
    }
  }
}
