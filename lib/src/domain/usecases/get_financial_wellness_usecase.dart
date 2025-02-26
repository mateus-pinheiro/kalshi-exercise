import 'package:either_dart/either.dart';
import 'package:kalshi_exercise/src/core/usecase.dart';
import 'package:kalshi_exercise/src/domain/entities/financial_wellness_entity.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/domain/failures/financial_wellness_failure.dart';

const double annualTaxRate = 0.08;
const double monthsInYear = 12;
const double percentageMultiplier = 100;

const double healthyThreshold = 25;
const double mediumThreshold = 75;

class GetFinancialWellnessUsecase
    extends Usecase<FinancialWellnessStatus, FinancialWellnessEntity> {
  @override
  Either<FinancialWellnessFailure, FinancialWellnessStatus> call(
      FinancialWellnessEntity params) {
    double netAnnualIncome =
        params.annualGrossIncome - (params.annualGrossIncome * annualTaxRate);
    double totalAnnualCosts = params.averageMonthlyCosts * monthsInYear;
    double costsToIncomeRatio =
        (totalAnnualCosts / netAnnualIncome) * percentageMultiplier;

    return costsToIncomeRatio <= healthyThreshold
        ? Right(FinancialWellnessStatus.healthy)
        : costsToIncomeRatio <= mediumThreshold
            ? Right(FinancialWellnessStatus.medium)
            : Right(FinancialWellnessStatus.low);
  }
}
