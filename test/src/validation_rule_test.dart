import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'UppercaseValidationRule',
    () {
      late UppercaseValidationRule rule;

      setUp(() => rule = UppercaseValidationRule());

      test(
        'name',
        () {
          expect(rule.name, 'Has uppercase letter');
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
    'LowercaseValidationRule',
    () {
      late LowercaseValidationRule rule;

      setUp(() => rule = LowercaseValidationRule());

      test(
        'name',
        () {
          expect(rule.name, 'Has lowercase letter');
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
    'DigitValidationRule',
    () {
      late DigitValidationRule rule;

      setUp(() => rule = DigitValidationRule());

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
    'SpecialCharacterValidationRule',
    () {
      late SpecialCharacterValidationRule rule;

      setUp(() => rule = SpecialCharacterValidationRule());

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
    'MinCharactersValidationRule',
    () {
      late MinCharactersValidationRule rule;

      test(
        'assert that min value is greater than 0',
        () {
          expect(() => MinCharactersValidationRule(0), throwsAssertionError);
          expect(() => MinCharactersValidationRule(-1), throwsAssertionError);
        },
      );

      test(
        'name',
        () {
          rule = MinCharactersValidationRule(6);
          expect(rule.name, 'Min of 6 characters');
        },
      );

      test(
        'validate',
        () {
          rule = MinCharactersValidationRule(3);
          expect(rule.validate('123'), true);

          rule = MinCharactersValidationRule(6);
          expect(rule.validate('123456'), true);

          rule = MinCharactersValidationRule(3);
          expect(rule.validate('1'), false);

          rule = MinCharactersValidationRule(6);
          expect(rule.validate('123'), false);
        },
      );
    },
  );

  group(
    'MaxCharactersValidationRule',
    () {
      late MaxCharactersValidationRule rule;

      test(
        'assert that max value is greater than 0',
        () {
          expect(() => MaxCharactersValidationRule(0), throwsAssertionError);
          expect(() => MaxCharactersValidationRule(-1), throwsAssertionError);
        },
      );

      test(
        'name',
        () {
          rule = MaxCharactersValidationRule(6);
          expect(rule.name, 'Max of 6 characters');
        },
      );

      test(
        'validate',
        () {
          rule = MaxCharactersValidationRule(3);
          expect(rule.validate('1'), true);
          expect(rule.validate('12'), true);
          expect(rule.validate('123'), true);

          rule = MaxCharactersValidationRule(6);
          expect(rule.validate('123456'), true);

          rule = MaxCharactersValidationRule(3);
          expect(rule.validate('1234'), false);

          rule = MaxCharactersValidationRule(6);
          expect(rule.validate('1234567'), false);
        },
      );
    },
  );

  group(
    'MinAndMaxCharactersValidationRule',
    () {
      late MinAndMaxCharactersValidationRule rule;

      test(
        'assert that min and max value are greater than 0 and that max value is greater or equal than min value',
        () {
          expect(
              () => MinAndMaxCharactersValidationRule(
                    min: 0,
                    max: 3,
                  ),
              throwsAssertionError);
          expect(
              () => MinAndMaxCharactersValidationRule(
                    min: 3,
                    max: 0,
                  ),
              throwsAssertionError);
          expect(
              () => MinAndMaxCharactersValidationRule(
                    min: 3,
                    max: 1,
                  ),
              throwsAssertionError);
        },
      );

      test(
        'name',
        () {
          rule = MinAndMaxCharactersValidationRule(
            min: 6,
            max: 12,
          );
          expect(rule.name, 'Min 6 and Max 12 characters');
        },
      );

      test(
        'validate',
        () {
          rule = MinAndMaxCharactersValidationRule(
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
