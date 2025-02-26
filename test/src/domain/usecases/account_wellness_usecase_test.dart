import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_exercise/src/domain/entities/financial_wellness_entity.dart';
import 'package:kalshi_exercise/src/domain/usecases/get_financial_wellness_usecase.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';

void main() {
  late GetFinancialWellnessUsecase usecase;
  late FinancialWellnessEntity financialWellnessEntity;
  late FinancialWellnessStatus statusResult;

  setUp(() {
    usecase = GetFinancialWellnessUsecase();
  });

  test('financial wellness healthy successfully', () {
    financialWellnessEntity = FinancialWellnessEntity(1000, 10);
    final either = usecase.call(financialWellnessEntity);

    either.fold(
      (failure) => null,
      (status) => statusResult = status,
    );

    expect(statusResult, FinancialWellnessStatus.healthy);
  });

  test('financial wellness medium successfully', () {
    financialWellnessEntity = FinancialWellnessEntity(1000, 30);
    final either = usecase.call(financialWellnessEntity);

    either.fold(
      (failure) => null,
      (status) => statusResult = status,
    );

    expect(statusResult, FinancialWellnessStatus.medium);
  });

  test('financial wellness low successfully', () {
    financialWellnessEntity = FinancialWellnessEntity(1000, 80);
    final result = usecase.call(financialWellnessEntity);

    result.fold(
      (failure) => null,
      (status) => statusResult = status,
    );

    expect(statusResult, FinancialWellnessStatus.low);
  });
}
