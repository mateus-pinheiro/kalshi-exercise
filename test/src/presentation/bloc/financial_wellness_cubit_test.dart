import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/domain/failures/financial_wellness_failure.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:kalshi_exercise/src/presentation/financial_wellness/bloc/cubit/financial_wellness_cubit.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/bloc/state/financial_wellness_state.dart';
import 'package:kalshi_exercise/src/domain/entities/financial_wellness_entity.dart';
import 'package:kalshi_exercise/src/domain/usecases/get_financial_wellness_usecase.dart';

import 'financial_wellness_cubit_test.mocks.dart';

@GenerateMocks([GetFinancialWellnessUsecase])
void main() {
  late FinancialWellnessCubit financialWellnessCubit;
  late MockGetFinancialWellnessUsecase mockGetFinancialWellnessUsecase;

  provideDummy<Either<FinancialWellnessFailure, FinancialWellnessStatus>>(
      Right(FinancialWellnessStatus.medium));

  setUp(() {
    mockGetFinancialWellnessUsecase = MockGetFinancialWellnessUsecase();
    financialWellnessCubit =
        FinancialWellnessCubit(mockGetFinancialWellnessUsecase);
  });

  tearDown(() {
    financialWellnessCubit.close();
  });

  final financialWellnessEntity = FinancialWellnessEntity(1000, 30);
  final financialWellnessStatus = FinancialWellnessStatus.medium;

  blocTest<FinancialWellnessCubit, FinancialWellnessState>(
    'emits [FinancialWellnessSuccessfullyState] when financialWellness is successful',
    build: () {
      when(mockGetFinancialWellnessUsecase(any))
          .thenAnswer((_) => Right(financialWellnessStatus));
      return financialWellnessCubit;
    },
    act: (cubit) => cubit.financialWellness(financialWellnessEntity),
    expect: () => [
      FinancialWellnessSuccessfullyState(financialWellnessStatus),
    ],
  );

  blocTest<FinancialWellnessCubit, FinancialWellnessState>(
    'emits [FinancialWellnessFailState] when financialWellness fails',
    build: () {
      when(mockGetFinancialWellnessUsecase(any))
          .thenAnswer((_) => Left(FinancialWellnessFailure('')));
      return financialWellnessCubit;
    },
    act: (cubit) => cubit.financialWellness(financialWellnessEntity),
    expect: () => [
      FinancialWellnessFailState(FinancialWellnessFailure('')),
    ],
  );
}
