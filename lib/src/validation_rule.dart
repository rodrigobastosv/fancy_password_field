/// Base class representing a validation rule
/// Every new validation should extends this one.
///
abstract class ValidationRule {
  /// Name of the rule. You can use this atribute to
  /// show the name of the rule to the user, for example.
  String get name;

  /// Determines if the name of the rule will be displayed.
  bool get showName => true;

  /// A function that should be implemented and it represents
  /// the validation of the value. It should return [Boolean] indicating
  /// that the value passed pass the validation or not.
  bool validate(String value);
}

class RegexValidationRule extends ValidationRule {
  RegexValidationRule({
    required String regex,
    required String name,
    bool? showName,
  })  : _regex = regex,
        _name = name,
        _showName = showName;

  final String _regex;
  final String _name;
  final bool? _showName;

  @override
  String get name => _name;

  @override
  bool get showName => _showName ?? true;

  @override
  bool validate(String value) {
    return value.contains(RegExp(_regex));
  }
}

/// Validates that the value has at least one uppercase letter
class UppercaseValidationRule extends RegexValidationRule {
  UppercaseValidationRule({
    String? customText,
    bool? showName,
  }) : super(
            name: customText ?? 'Has uppercase letter',
            showName: showName ?? true,
            regex: r'[A-Z]');
}

/// Validates that the value has at least one lowercase letter
class LowercaseValidationRule extends RegexValidationRule {
  LowercaseValidationRule({
    String? customText,
    bool? showName,
  }) : super(
            name: customText ?? 'Has lowercase letter',
            showName: showName ?? true,
            regex: r'[a-z]');
}

/// Validates that the value has at least one digit
class DigitValidationRule extends RegexValidationRule {
  DigitValidationRule({
    String? customText,
    bool? showName,
  }) : super(
            name: customText ?? 'Has digit',
            showName: showName ?? true,
            regex: r'[0-9]');
}

/// Validates that the value has at least one special character
class SpecialCharacterValidationRule extends RegexValidationRule {
  SpecialCharacterValidationRule({
    String? customText,
    bool? showName,
  }) : super(
            name: customText ?? 'Has special character',
            showName: showName ?? true,
            regex: r'[!@#$%^&*(),.?":{}|<>]');
}

/// Validates that the value has at least [numberOfCharacters]
///
/// Throws [AssertionError] if numberOfCharacters <= 0.
class MinCharactersValidationRule extends ValidationRule {
  final String? _customText;
  final int _numberOfCharacters;
  final bool? _showName;

  MinCharactersValidationRule(
    this._numberOfCharacters, {
    String? customText,
    bool? showName,
  })  : assert(_numberOfCharacters > 0,
            'numberOfCharacters must be greater than 0'),
        _customText = customText,
        _showName = showName;

  @override
  String get name =>
      _customText?.replaceAll('{1}', _numberOfCharacters.toString()) ??
      'Min of $_numberOfCharacters characters';

  @override
  bool get showName => _showName ?? true;

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
  final bool? _showName;

  MaxCharactersValidationRule(
    this._numberOfCharacters, {
    String? customText,
    bool? showName,
  })  : assert(_numberOfCharacters > 0,
            'numberOfCharacters must be greater than 0'),
        _customText = customText,
        _showName = showName;

  @override
  String get name =>
      _customText?.replaceAll('{1}', _numberOfCharacters.toString()) ??
      'Max of $_numberOfCharacters characters';

  @override
  bool get showName => _showName ?? true;

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
  final bool? _showName;

  MinAndMaxCharactersValidationRule({
    required int min,
    required int max,
    String? customText,
    bool? showName,
  })  : assert(min > 0, 'min must be greater than 0'),
        assert(max > 0, 'max must be greater than 0'),
        assert(max >= min, 'max must be greater than min'),
        _min = min,
        _max = max,
        _customText = customText,
        _showName = showName;

  @override
  String get name =>
      _customText
          ?.replaceAll('{1}', _min.toString())
          .replaceAll('{2}', _max.toString()) ??
      'Min $_min and Max $_max characters';

  @override
  bool get showName => _showName ?? true;

  @override
  bool validate(String value) {
    return (value.length >= _min && value.length < _max) ||
        (value.length > _min && value.length <= _max);
  }
}
