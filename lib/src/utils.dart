import 'package:fancy_password_field/src/validation_rule.dart';

bool isRuleSatisfied(String value, ValidationRule rule) {
  if (rule == ValidationRule.uppercaseLetter) {
    return value.contains('A');
  } else if (rule == ValidationRule.specialCharacter) {
    return value.contains('#');
  }
  return false;
}
