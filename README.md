[![codecov](https://codecov.io/gh/rodrigobastosv/fancy_password_field/branch/main/graph/badge.svg?token=ts734vMC5z)](https://codecov.io/gh/rodrigobastosv/fancy_password_field)

#  Introduction

FancyPasswordField is a widget that acts as a password validation field. You can have all the features of a commom password field, and also gets cool features like setting validation rules and password strength.

# Basic Usage

The most simple usage is just using FancyPasswordField withou any properties.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: FancyPasswordField(),
      ),
    );
  }
}
```

This will create a password field with some default configurations. The default behavior is to show the strength indicator
above the form field. You can disabled this behavior passing false to the `hasStrengthIndicator` property.

---first use---

We can go a bit further and pass some validations rules to our widget.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: FancyPasswordField(
            validationRules: {
                DigitValidationRule(),
                UppercaseValidationRule(),
                LowercaseValidationRule(),
                SpecialCharacterValidationRule(),
                MinCharactersValidationRule(6),
                MaxCharactersValidationRule(12),
            },
        ),
      ),
    );
  }
}
```

---rules usage---

These package comes if some pre defined commom rules so you can just use out of the box. Feel free to implement your own 
[ValidationRule] and adds normaly to the password field.

# Customization
The [FancyPasswordField] comes with some pre defined widget that show some okish good looking components for the rules
and for the rules. But the widget was designed to be fully customizable. So you can pass your own builers to both the
strength password widget and the rules widget. 

Above we can see an example of some possible customisation for these fields.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SizedBox(
            width: 400,
            child: FancyPasswordField(
                validationRules: {
                    DigitValidationRule(),
                    UppercaseValidationRule(),
                    LowercaseValidationRule(),
                    SpecialCharacterValidationRule(),
                    MinCharactersValidationRule(6),
                    MaxCharactersValidationRule(12),
                },
                strengthIndicatorBuilder: (strength) => Text(
                  strength.toString(),
                ),
                validationRuleBuilder: (rules, value) {
                  if (value.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: rules
                        .map(
                          (rule) => rule.validate(value)
                              ? Row(
                                  children: [
                                    const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                        rule.name,
                                        style: const TextStyle(
                                            color: Colors.green,
                                        ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                        rule.name,
                                        style: const TextStyle(
                                            color: Colors.red,
                                        ),
                                    ),
                                  ],
                                ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
      ),
    );
  }
}
```

--builder usage---

## Suggestions & Bugs

For any suggestions or bug report please head to [issue tracker][tracker].

[tracker]: https://github.com/rodrigobastosv/fancy_password_field/issues