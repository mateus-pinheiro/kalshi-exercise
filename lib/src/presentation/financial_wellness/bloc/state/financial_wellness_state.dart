import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalshi_exercise/src/domain/failures/financial_wellness_failure.dart';

import '../../../../domain/entities/wellness_enum.dart';

part 'financial_wellness_state.freezed.dart';

@Freezed(equal: false)
sealed class FinancialWellnessState with _$FinancialWellnessState {
  const FinancialWellnessState._();

  factory FinancialWellnessState.initial() = FinancialWellnessStateInitial;

  factory FinancialWellnessState.error({
    @Default(FinancialWellnessFailure("Generic Error"))
    FinancialWellnessFailure failure,
  }) = FinancialWellnessStateError;

  factory FinancialWellnessState.success({
    required FinancialWellnessStatus financialWellnessStatus,
  }) = FinancialWellnessStateSuccess;
}
