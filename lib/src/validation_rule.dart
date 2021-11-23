abstract class ValidationRule {
  String get name;

  bool validate(String value);
}

class HasUppercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Has uppercase';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }
}

class HasLowercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Has lowercase';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }
}

class HasDigitValidationRule extends ValidationRule {
  @override
  String get name => 'Has digit';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }
}

class HasSpecialCharacterValidationRule extends ValidationRule {
  @override
  String get name => 'Has special character';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}

class HasMinCharactersValidationRule extends ValidationRule {
  HasMinCharactersValidationRule(this.numberOfCharacters);

  final int numberOfCharacters;

  @override
  String get name => 'Min of $numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length >= numberOfCharacters;
  }
}

class HasMaxCharactersValidationRule extends ValidationRule {
  HasMaxCharactersValidationRule(this.numberOfCharacters);

  final int numberOfCharacters;

  @override
  String get name => 'Max of $numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length <= numberOfCharacters;
  }
}