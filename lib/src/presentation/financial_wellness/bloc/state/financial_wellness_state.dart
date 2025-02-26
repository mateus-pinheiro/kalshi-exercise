import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/domain/failures/financial_wellness_failure.dart';

class FinancialWellnessState {}

class FinancialWellnessSuccessfullyState extends FinancialWellnessState {
  final FinancialWellnessStatus financialWellnessStatus;

  FinancialWellnessSuccessfullyState(this.financialWellnessStatus);
}

class FinancialWellnessFailState extends FinancialWellnessState {
  final FinancialWellnessFailure financialWellnessFailure;

  FinancialWellnessFailState(this.financialWellnessFailure);
}
