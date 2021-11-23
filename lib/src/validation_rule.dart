abstract class ValidationRule {
  String get name;

  bool validate(String value);
}

class UppercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Has uppercase letter';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }
}

class LowercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Has lowercase letter';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }
}

class DigitValidationRule extends ValidationRule {
  @override
  String get name => 'Has digit';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }
}

class SpecialCharacterValidationRule extends ValidationRule {
  @override
  String get name => 'Has special character';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}

class MinCharactersValidationRule extends ValidationRule {
  MinCharactersValidationRule(this.numberOfCharacters)
      : assert(numberOfCharacters > 0);

  final int numberOfCharacters;

  @override
  String get name => 'Min of $numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length >= numberOfCharacters;
  }
}

class MaxCharactersValidationRule extends ValidationRule {
  MaxCharactersValidationRule(this.numberOfCharacters)
      : assert(numberOfCharacters > 0);

  final int numberOfCharacters;

  @override
  String get name => 'Max of $numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length <= numberOfCharacters;
  }
}

class MinAndMaxCharactersValidationRule extends ValidationRule {
  MinAndMaxCharactersValidationRule({
    required this.min,
    required this.max,
  })  : assert(min > 0),
        assert(max > 0),
        assert(max >= min);

  final int min;
  final int max;

  @override
  String get name => 'Min $min and Max $max characters';

  @override
  bool validate(String value) {
    return (value.length >= min && value.length < max) ||
        (value.length > min && value.length <= max);
  }
}
