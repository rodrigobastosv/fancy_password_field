/// Base class representing a validation rule
/// Every new validation should extends this one.
///
abstract class ValidationRule {
  /// Name of the rule. You can use this atribute to
  /// show the name of the rule to the user, for example.
  String get name;

  /// A function that should be implemented and it represents
  /// the validation of the value. It should return [Boolean] indicating
  /// that the value passed pass the validation or not.
  bool validate(String value);
}

/// Validates that the value has at least one uppercase letter
class UppercaseValidationRule extends ValidationRule {
  final String? _customText;

  UppercaseValidationRule({
    String? customText,
  }) : _customText = customText;

  @override
  String get name => _customText ?? 'Has uppercase letter';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }
}

/// Validates that the value has at least one lowercase letter
class LowercaseValidationRule extends ValidationRule {
  final String? _customText;

  LowercaseValidationRule({
    String? customText,
  }) : _customText = customText;

  @override
  String get name => _customText ?? 'Has lowercase letter';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }
}

/// Validates that the value has at least one digit
class DigitValidationRule extends ValidationRule {
  final String? _customText;

  DigitValidationRule({
    String? customText,
  }) : _customText = customText;

  @override
  String get name => _customText ?? 'Has digit';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }
}

/// Validates that the value has at least one special character
class SpecialCharacterValidationRule extends ValidationRule {
  final String? _customText;

  SpecialCharacterValidationRule({
    String? customText,
  }) : _customText = customText;

  @override
  String get name => _customText ?? 'Has special character';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}

/// Validates that the value has at least [numberOfCharacters]
///
/// Throws [AssertionError] if numberOfCharacters <= 0.
class MinCharactersValidationRule extends ValidationRule {
  final String? _customText;
  final int _numberOfCharacters;

  MinCharactersValidationRule(
    this._numberOfCharacters, {
    String? customText,
  })  : assert(_numberOfCharacters > 0,
            'numberOfCharacters must be greater than 0'),
        _customText = customText;

  @override
  String get name =>
      _customText?.replaceAll('{1}', _numberOfCharacters.toString()) ??
      'Min of $_numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length >= _numberOfCharacters;
  }
}

/// Validates that the value has at most [numberOfCharacters]
///
/// Throws [AssertionError] if numberOfCharacters <= 0.
class MaxCharactersValidationRule extends ValidationRule {
  final String? _customText;
  final int _numberOfCharacters;

  MaxCharactersValidationRule(
    this._numberOfCharacters, {
    String? customText,
  })  : assert(_numberOfCharacters > 0,
            'numberOfCharacters must be greater than 0'),
        _customText = customText;

  @override
  String get name =>
      _customText?.replaceAll('{1}', _numberOfCharacters.toString()) ??
      'Max of $_numberOfCharacters characters';

  @override
  bool validate(String value) {
    return value.length <= _numberOfCharacters;
  }
}

/// Validates that the value is at least [min] size and  at most [max]
///
/// Throws [AssertionError] if min <= 0.
/// Throws [AssertionError] if max <= 0.
/// Throws [AssertionError] if min > max.
class MinAndMaxCharactersValidationRule extends ValidationRule {
  final String? _customText;
  final int _min;
  final int _max;
  MinAndMaxCharactersValidationRule({
    required int min,
    required int max,
    String? customText,
  })  : assert(min > 0, 'min must be greater than 0'),
        assert(max > 0, 'max must be greater than 0'),
        assert(max >= min, 'max must be greater than min'),
        _min = min,
        _max = max,
        _customText = customText;

  @override
  String get name =>
      _customText
          ?.replaceAll('{1}', _min.toString())
          .replaceAll('{2}', _max.toString()) ??
      'Min $_min and Max $_max characters';

  @override
  bool validate(String value) {
    return (value.length >= _min && value.length < _max) ||
        (value.length > _min && value.length <= _max);
  }
}