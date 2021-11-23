import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'HasUppercaseValidationRule',
    () {
      late HasUppercaseValidationRule rule;

      setUp(() => rule = HasUppercaseValidationRule());

      test(
        'name',
        () {
          expect(rule.name, 'Has uppercase');
        },
      );

      test(
        'validate',
        () {
          expect(rule.validate('A'), true);
          expect(rule.validate('a'), false);
          expect(rule.validate('aAa'), true);
          expect(rule.validate('AaA'), true);
          expect(rule.validate('.'), false);
        },
      );
    },
  );

  group(
    'HasLowercaseValidationRule',
    () {
      late HasLowercaseValidationRule rule;

      setUp(() => rule = HasLowercaseValidationRule());

      test(
        'name',
        () {
          expect(rule.name, 'Has lowercase');
        },
      );

      test(
        'validate',
        () {
          expect(rule.validate('A'), false);
          expect(rule.validate('a'), true);
          expect(rule.validate('aAa'), true);
          expect(rule.validate('AaA'), true);
          expect(rule.validate('.'), false);
        },
      );
    },
  );

  group(
    'HasDigitValidationRule',
    () {
      late HasDigitValidationRule rule;

      setUp(() => rule = HasDigitValidationRule());

      test(
        'name',
        () {
          expect(rule.name, 'Has digit');
        },
      );

      test(
        'validate',
        () {
          expect(rule.validate('A'), false);
          expect(rule.validate('1'), true);
          expect(rule.validate('a123bc'), true);
          expect(rule.validate('AaA'), false);
          expect(rule.validate('.'), false);
        },
      );
    },
  );

  group(
    'HasSpecialCharacterValidationRule',
    () {
      late HasSpecialCharacterValidationRule rule;

      setUp(() => rule = HasSpecialCharacterValidationRule());

      test(
        'name',
        () {
          expect(rule.name, 'Has special character');
        },
      );

      test(
        'validate',
        () {
          expect(rule.validate('!'), true);
          expect(rule.validate('@'), true);
          expect(rule.validate('#'), true);
          expect(rule.validate('\$'), true);
          expect(rule.validate('%'), true);
          expect(rule.validate('^'), true);
          expect(rule.validate('&'), true);
          expect(rule.validate('*'), true);
          expect(rule.validate('('), true);
          expect(rule.validate(')'), true);
          expect(rule.validate(','), true);
          expect(rule.validate('.'), true);
          expect(rule.validate('?'), true);
          expect(rule.validate('"'), true);
          expect(rule.validate(':'), true);
          expect(rule.validate('{'), true);
          expect(rule.validate('}'), true);
          expect(rule.validate('|'), true);
          expect(rule.validate('<'), true);
          expect(rule.validate('>'), true);
          expect(rule.validate('1'), false);
          expect(rule.validate('a123bc'), false);
          expect(rule.validate('AaA'), false);
        },
      );
    },
  );

  group(
    'HasMinCharactersValidationRule',
    () {
      late HasMinCharactersValidationRule rule;

      test(
        'assert that min value is greater than 0',
        () {
          expect(() => HasMinCharactersValidationRule(0), throwsAssertionError);
          expect(
              () => HasMinCharactersValidationRule(-1), throwsAssertionError);
        },
      );

      test(
        'name',
        () {
          rule = HasMinCharactersValidationRule(6);
          expect(rule.name, 'Min of 6 characters');
        },
      );

      test(
        'validate',
        () {
          rule = HasMinCharactersValidationRule(3);
          expect(rule.validate('123'), true);

          rule = HasMinCharactersValidationRule(6);
          expect(rule.validate('123456'), true);

          rule = HasMinCharactersValidationRule(3);
          expect(rule.validate('1'), false);

          rule = HasMinCharactersValidationRule(6);
          expect(rule.validate('123'), false);
        },
      );
    },
  );

  group(
    'HasMaxCharactersValidationRule',
    () {
      late HasMaxCharactersValidationRule rule;

      test(
        'assert that max value is greater than 0',
        () {
          expect(() => HasMaxCharactersValidationRule(0), throwsAssertionError);
          expect(
              () => HasMaxCharactersValidationRule(-1), throwsAssertionError);
        },
      );

      test(
        'name',
        () {
          rule = HasMaxCharactersValidationRule(6);
          expect(rule.name, 'Max of 6 characters');
        },
      );

      test(
        'validate',
        () {
          rule = HasMaxCharactersValidationRule(3);
          expect(rule.validate('1'), true);
          expect(rule.validate('12'), true);
          expect(rule.validate('123'), true);

          rule = HasMaxCharactersValidationRule(6);
          expect(rule.validate('123456'), true);

          rule = HasMaxCharactersValidationRule(3);
          expect(rule.validate('1234'), false);

          rule = HasMaxCharactersValidationRule(6);
          expect(rule.validate('1234567'), false);
        },
      );
    },
  );

  group(
    'HasMinAndMaxCharactersValidationRule',
    () {
      late HasMinAndMaxCharactersValidationRule rule;

      test(
        'assert that min and max value are greater than 0 and that max value is greater or equal than min value',
        () {
          expect(
              () => HasMinAndMaxCharactersValidationRule(
                    min: 0,
                    max: 3,
                  ),
              throwsAssertionError);
          expect(
              () => HasMinAndMaxCharactersValidationRule(
                    min: 3,
                    max: 0,
                  ),
              throwsAssertionError);
          expect(
              () => HasMinAndMaxCharactersValidationRule(
                    min: 3,
                    max: 1,
                  ),
              throwsAssertionError);
        },
      );

      test(
        'name',
        () {
          rule = HasMinAndMaxCharactersValidationRule(
            min: 6,
            max: 12,
          );
          expect(rule.name, 'Min 6 and Max 12 characters');
        },
      );

      test(
        'validate',
        () {
          rule = HasMinAndMaxCharactersValidationRule(
            min: 6,
            max: 12,
          );
          expect(rule.validate('1'), false);
          expect(rule.validate('12'), false);
          expect(rule.validate('123'), false);
          expect(rule.validate('1234'), false);
          expect(rule.validate('12345'), false);
          expect(rule.validate('123456'), true);
          expect(rule.validate('1234567'), true);
          expect(rule.validate('12345678'), true);
          expect(rule.validate('123456789'), true);
          expect(rule.validate('12345678910'), true);
          expect(rule.validate('123456789101'), true);
          expect(rule.validate('1234567891011'), false);
          expect(rule.validate('12345678910111'), false);
          expect(rule.validate('123456789101112'), false);
          expect(rule.validate('1234567891011121'), false);
          expect(rule.validate('12345678910111213'), false);

          
        },
      );
    },
  );
}
