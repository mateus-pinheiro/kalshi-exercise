import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_exercise/domain/entities/account_wellness_entity.dart';
import 'package:kalshi_exercise/domain/usecases/get_account_wellness_usecase.dart';
import 'package:kalshi_exercise/domain/entities/account_wellness_enum.dart';

void main() {
  late GetAccountWellnessUsecase usecase;
  late AccountWellnessEntity accountWellnessEntity;

  setUp(() {
    usecase = GetAccountWellnessUsecase();
  });

  test('account wellness healthy', () {
    accountWellnessEntity = AccountWellnessEntity(1000, 10);
    final result = usecase.call(accountWellnessEntity);
    expect(result, AccountWellnessStatus.healthy);
  });

  test('account wellness medium', () {
    accountWellnessEntity = AccountWellnessEntity(1000, 30);
    final result = usecase.call(accountWellnessEntity);
    expect(result, AccountWellnessStatus.medium);
  });

  test('account wellness low', () {
    accountWellnessEntity = AccountWellnessEntity(1000, 80);
    final result = usecase.call(accountWellnessEntity);
    expect(result, AccountWellnessStatus.low);
  });
}
