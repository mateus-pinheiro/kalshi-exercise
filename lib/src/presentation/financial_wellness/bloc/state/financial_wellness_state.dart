import 'package:equatable/equatable.dart';

import '../../../../domain/entities/wellness_enum.dart';
import '../../../../domain/failures/financial_wellness_failure.dart';

class FinancialWellnessState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FinancialWellnessSuccessfullyState extends FinancialWellnessState {
  final FinancialWellnessStatus financialWellnessStatus;

  @override
  List<Object?> get props => [financialWellnessStatus];

  FinancialWellnessSuccessfullyState(this.financialWellnessStatus);
}

class FinancialWellnessFailState extends FinancialWellnessState {
  final FinancialWellnessFailure financialWellnessFailure;

  @override
  List<Object?> get props => [financialWellnessFailure];

  FinancialWellnessFailState(this.financialWellnessFailure);
}
