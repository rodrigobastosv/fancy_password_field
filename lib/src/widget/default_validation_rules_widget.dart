import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';

typedef RuleBuilder = Widget Function(String ruleName);

class DefaultValidationRulesWidget extends StatelessWidget {
  const DefaultValidationRulesWidget({
    Key? key,
    required this.value,
    required this.validationRules,
  }) : super(key: key);

  final String value;
  final Set<ValidationRule> validationRules;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 6),
        Wrap(
          children: validationRules
              .map(
                (rule) => rule.validate(value) && value.isNotEmpty
                    ? DefaultRulePassedWidget(rule.name)
                    : DefaultRuleNotPassedWidget(rule.name),
              )
              .toList(),
        ),
      ],
    );
  }
}

@visibleForTesting
class DefaultRulePassedWidget extends StatelessWidget {
  const DefaultRulePassedWidget(
    this.name, {
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        name,
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

@visibleForTesting
class DefaultRuleNotPassedWidget extends StatelessWidget {
  const DefaultRuleNotPassedWidget(
    this.name, {
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        name,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
