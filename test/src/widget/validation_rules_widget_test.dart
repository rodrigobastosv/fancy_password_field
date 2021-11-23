import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:fancy_password_field/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> loadWidget(
    WidgetTester tester, {
    required ValidationRulesBuilder? builder,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ValidationRulesWidget(
            password: 'password',
            validationRules: const <ValidationRule>{},
            validationRuleBuilder: builder,
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
        builder: null,
      );

      expect(find.byType(ValidationRulesWidget), findsOneWidget);
    },
  );

  testWidgets(
    'should show DefaultValidationRulesWidget if builder is null',
    (tester) async {
      await loadWidget(
        tester,
        builder: null,
      );

      expect(find.byType(DefaultValidationRulesWidget), findsOneWidget);
    },
  );

  testWidgets(
    'should execute validationRuleBuilder if one is provided',
    (tester) async {
      await loadWidget(
        tester,
        builder: (rules, value) => Container(
          key: const ValueKey('widget-from-builder'),
        ),
      );

      expect(find.byKey(const ValueKey('widget-from-builder')), findsOneWidget);
    },
  );
}
