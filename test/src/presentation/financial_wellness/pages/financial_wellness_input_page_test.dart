import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi_exercise/src/core/di.dart';
import 'package:kalshi_exercise/src/core/app_router.dart';
import 'package:kalshi_exercise/src/domain/entities/financial_wellness_entity.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/bloc/cubit/financial_wellness_cubit.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/bloc/state/financial_wellness_state.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/pages/financial_wellness_input_page.dart';
import 'package:kalshi_exercise/src/presentation/shared/shared.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'financial_wellness_input_page_test.mocks.dart';

@GenerateMocks([FinancialWellnessCubit, GoRouter])
void main() {
  late MockFinancialWellnessCubit mockCubit;
  late MockGoRouter mockGoRouter;

  provideDummy<FinancialWellnessState>(FinancialWellnessStateSuccess(
      financialWellnessStatus: FinancialWellnessStatus.healthy));

  setUp(() {
    mockCubit = MockFinancialWellnessCubit();
    mockGoRouter = MockGoRouter();

    // Register mock cubit with GetIt
    getIt.registerSingleton<FinancialWellnessCubit>(mockCubit);

    when(mockCubit.state).thenAnswer((_) => FinancialWellnessState.success(
        financialWellnessStatus: FinancialWellnessStatus.healthy));
    when(mockCubit.stream).thenAnswer(
      (_) => Stream.value(
        FinancialWellnessStateSuccess(
          financialWellnessStatus: FinancialWellnessStatus.healthy,
        ),
      ),
    );

    when(mockGoRouter.pushNamed(
      any,
      extra: anyNamed('extra'),
    )).thenAnswer((_) async => null);
  });

  tearDown(() {
    // Unregister mock cubit
    getIt.unregister<FinancialWellnessCubit>();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<FinancialWellnessCubit>.value(
        value: mockCubit,
        child: InheritedGoRouter(
          goRouter: mockGoRouter,
          child: const AccountWellnessInputPage(),
        ),
      ),
    );
  }

  testWidgets('should display title text correctly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Text), findsWidgets);
    expect(find.byType(KalshiForm), findsOneWidget);
  });

  testWidgets('should display form card with logo and inputs', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(KalshiForm), findsOneWidget);
  });

  testWidgets('should navigate to results page on successful submission',
      (tester) async {
    final entity = FinancialWellnessEntity(
      120000.0, // annual gross income
      5000.0, // average monthly costs
    );

    when(mockCubit.financialWellness(entity)).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Find and interact with form
    final form = find.byType(KalshiForm);
    expect(form, findsOneWidget);

    // Trigger form submission through the callback
    await tester.tap(find.byType(KalshiForm));
    await tester.pumpAndSettle();

    // Verify navigation
    verify(mockGoRouter.pushNamed(
      AppRoutes.result,
      extra: anyNamed('extra'),
    )).called(1);
  });
}
