import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/pages/financial_wellness_result_page.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/widgets/score_card.dart';
import 'package:kalshi_exercise/src/presentation/shared/shared.dart';
import 'package:kalshi_exercise/src/presentation/financial_wellness/widgets/security_info.dart';

void main() {
  final testArgs = AccountWellnessResultPageArguments(
    status: FinancialWellnessStatus.healthy,
  );

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: AccountWellnessResultPage(args: testArgs),
    );
  }

  testWidgets('should display all required components', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(KalshiAppbar), findsOneWidget);
    expect(find.byType(ScoreCard), findsOneWidget);
    expect(find.byType(SecurityInfo), findsOneWidget);
  });

  testWidgets('should display correct status in ScoreCard', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final scoreCard = tester.widget<ScoreCard>(find.byType(ScoreCard));
    expect(scoreCard.status, equals(FinancialWellnessStatus.healthy));
  });

  group('test different wellness statuses', () {
    testWidgets('should handle healthy status', (tester) async {
      final args = AccountWellnessResultPageArguments(
        status: FinancialWellnessStatus.healthy,
      );
      await tester.pumpWidget(MaterialApp(
        home: AccountWellnessResultPage(args: args),
      ));

      final scoreCard = tester.widget<ScoreCard>(find.byType(ScoreCard));
      expect(scoreCard.status, equals(FinancialWellnessStatus.healthy));
    });

    testWidgets('should handle medium status', (tester) async {
      final args = AccountWellnessResultPageArguments(
        status: FinancialWellnessStatus.medium,
      );
      await tester.pumpWidget(MaterialApp(
        home: AccountWellnessResultPage(args: args),
      ));

      final scoreCard = tester.widget<ScoreCard>(find.byType(ScoreCard));
      expect(scoreCard.status, equals(FinancialWellnessStatus.medium));
    });

    testWidgets('should handle low status', (tester) async {
      final args = AccountWellnessResultPageArguments(
        status: FinancialWellnessStatus.low,
      );
      await tester.pumpWidget(MaterialApp(
        home: AccountWellnessResultPage(args: args),
      ));

      final scoreCard = tester.widget<ScoreCard>(find.byType(ScoreCard));
      expect(scoreCard.status, equals(FinancialWellnessStatus.low));
    });
  });
}