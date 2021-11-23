import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:fancy_password_field/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> loadWidget(
    WidgetTester tester, {
    required String value,
    required Set<ValidationRule> rules,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DefaultValidationRulesWidget(
            value: value,
            validationRules: rules,
          ),
        ),
      ),
    );
  }

  testWidgets(
    'should build without exploding',
    (tester) async {
      await loadWidget(
        tester,
        value: 'test',
        rules: {},
      );

      expect(find.byType(DefaultValidationRulesWidget), findsOneWidget);
    },
  );

  testWidgets(
    'should show DefaultRulePassedWidget when rule passes',
    (tester) async {
      await loadWidget(
        tester,
        value: 'Test',
        rules: {
          HasUppercaseValidationRule(),
        },
      );

      expect(find.byType(DefaultRulePassedWidget), findsOneWidget);
    },
  );

  testWidgets(
    'should show DefaultRuleNotPassedWidget when rule does not pass',
    (tester) async {
      await loadWidget(
        tester,
        value: 'test',
        rules: {
          HasUppercaseValidationRule(),
        },
      );

      expect(find.byType(DefaultRuleNotPassedWidget), findsOneWidget);
    },
  );
}
