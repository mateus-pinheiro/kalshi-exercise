import 'package:flutter/material.dart';

import '../../../domain/entities/account_wellness_enum.dart';

extension AccountWellnessStatusExtension on AccountWellnessStatus {
  String get text {
    switch (this) {
      case AccountWellnessStatus.healthy:
        return 'Healthy';
      case AccountWellnessStatus.medium:
        return 'Average';
      case AccountWellnessStatus.low:
        return 'Unhealthy';
    }
  }

  Color get color {
    switch (this) {
      case AccountWellnessStatus.healthy:
        return Colors.green;
      case AccountWellnessStatus.medium:
        return Colors.orange;
      case AccountWellnessStatus.low:
        return Colors.red;
    }
  }

  String get description {
    switch (this) {
      case AccountWellnessStatus.healthy:
        return 'Congratulations!';
      case AccountWellnessStatus.medium:
        return 'There is room for improvement.';
      case AccountWellnessStatus.low:
        return 'Caution!';
    }
  }
}
