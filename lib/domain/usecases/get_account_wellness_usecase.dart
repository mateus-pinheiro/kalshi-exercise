import 'package:either_dart/either.dart';
import 'package:kalshi_exercise/core/usecase.dart';
import 'package:kalshi_exercise/domain/entities/account_wellness_entity.dart';
import 'package:kalshi_exercise/domain/entities/account_wellness_enum.dart';
import 'package:kalshi_exercise/domain/failures/account_wellness_failure.dart';

const double annualTaxRate = 0.08;
const double monthsInYear = 12;
const double percentageMultiplier = 100;

const double healthyThreshold = 25;
const double mediumThreshold = 75;

class GetAccountWellnessUsecase
    extends Usecase<AccountWellnessStatus, AccountWellnessEntity> {
  @override
  Either<AccountWellnessFailure, AccountWellnessStatus> call(
      AccountWellnessEntity params) {
    double netAnnualIncome =
        params.annualGrossIncome - (params.annualGrossIncome * annualTaxRate);
    double totalAnnualCosts = params.averageMonthlyCosts * monthsInYear;
    double costsToIncomeRatio =
        (totalAnnualCosts / netAnnualIncome) * percentageMultiplier;

    return costsToIncomeRatio <= healthyThreshold
        ? Right(AccountWellnessStatus.healthy)
        : costsToIncomeRatio <= mediumThreshold
            ? Right(AccountWellnessStatus.medium)
            : Right(AccountWellnessStatus.low);
  }
}
