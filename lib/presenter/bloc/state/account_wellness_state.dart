import 'package:kalshi_exercise/domain/entities/account_wellness_enum.dart';
import 'package:kalshi_exercise/domain/failures/account_wellness_failure.dart';

class AccountWellnessState {
  final AccountWellnessStatus accountWellnessStatus;

  AccountWellnessState(this.accountWellnessStatus);
}

class AccountWellnessFailState {
  final AccountWellnessFailure accountWellnessFailure;

  AccountWellnessFailState(this.accountWellnessFailure);
}