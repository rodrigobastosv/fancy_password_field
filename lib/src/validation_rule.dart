abstract class ValidationRule {
  String get name;

  bool validate(String value);
}

class UppercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Uppercase';

  @override
  bool validate(String value) {
    return value.contains('A');
  }
}

class SpecialCharacterValidationRule extends ValidationRule {
  @override
  String get name => 'Special Character';

  @override
  bool validate(String value) {
    return value.contains('#');
  }
}

class MinCharactersValidationRule extends ValidationRule {
  MinCharactersValidationRule(this.numberOfCharacters);

  final int numberOfCharacters;

  @override
  String get name => 'Min of $numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length >= numberOfCharacters;
  }
}
