import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_exercise/domain/entities/account_wellness_entity.dart';
import 'package:kalshi_exercise/domain/usecases/get_account_wellness_usecase.dart';
import 'package:kalshi_exercise/domain/entities/account_wellness_enum.dart';

void main() {
  late GetAccountWellnessUsecase usecase;
  late AccountWellnessEntity accountWellnessEntity;
  late AccountWellnessStatus statusResult;

  setUp(() {
    usecase = GetAccountWellnessUsecase();
  });

  test('account wellness healthy successfully', () {
    accountWellnessEntity = AccountWellnessEntity(1000, 10);
    final either = usecase.call(accountWellnessEntity);

    either.fold(
      (failure) => null,
      (status) => statusResult = status,
    );

    expect(statusResult, AccountWellnessStatus.healthy);
  });

  test('account wellness medium successfully', () {
    accountWellnessEntity = AccountWellnessEntity(1000, 30);
    final either = usecase.call(accountWellnessEntity);

    either.fold(
      (failure) => null,
      (status) => statusResult = status,
    );

    expect(statusResult, AccountWellnessStatus.medium);
  });

  test('account wellness low successfully', () {
    accountWellnessEntity = AccountWellnessEntity(1000, 80);
    final result = usecase.call(accountWellnessEntity);

    result.fold(
      (failure) => null,
      (status) => statusResult = status,
    );

    expect(statusResult, AccountWellnessStatus.low);
  });
}
