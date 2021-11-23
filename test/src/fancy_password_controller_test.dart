import 'package:fancy_password_field/src/fancy_password_controller.dart';
import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FancyPasswordController passwordController;

  setUp(() {
    passwordController = FancyPasswordController();
  });

  test(
    'starts with empty ofending rules and areAllRulesValidated true',
    () {
      expect(passwordController.ofendingRules, isEmpty);
      expect(passwordController.areAllRulesValidated, true);
    },
  );

  test(
    'setRules should set the given rules',
    () {
      passwordController.setRules({
        UppercaseValidationRule(),
      });
      expect(passwordController.rules.first, isA<UppercaseValidationRule>());
    },
  );

  group(
    'onChange',
    () {
      test(
        'onChange should validate rules and result to no ofending rules',
        () {
          passwordController.setRules({
            UppercaseValidationRule(),
            LowercaseValidationRule(),
          });

          passwordController.onChange('Aa');

          expect(
            passwordController.ofendingRules,
            isEmpty,
          );
        },
      );

      test(
        'onChange should validate rules and result to a ofending rule',
        () {
          passwordController.setRules({
            UppercaseValidationRule(),
            LowercaseValidationRule(),
          });

          passwordController.onChange('A');

          expect(
            passwordController.ofendingRules.first,
            isA<LowercaseValidationRule>(),
          );
        },
      );
    },
  );
}
