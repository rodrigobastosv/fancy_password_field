import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';

typedef RuleBuilder = Widget Function(String ruleName);

class ValidationRulesWidget extends StatefulWidget {
  const ValidationRulesWidget({
    Key? key,
    required this.value,
    required this.validationRules,
    required this.validationRulePassedBuilder,
    required this.validationRuleNotPassedBuilder,
  }) : super(key: key);

  final String value;
  final Set<ValidationRule> validationRules;
  final RuleBuilder? validationRulePassedBuilder;
  final RuleBuilder? validationRuleNotPassedBuilder;

  @override
  State<ValidationRulesWidget> createState() => _ValidationRulesWidgetState();
}

class _ValidationRulesWidgetState extends State<ValidationRulesWidget> {
  late RuleBuilder validationRulePassedBuilder;
  late RuleBuilder validationRuleNotPassedBuilder;

  @override
  void initState() {
    super.initState();
    validationRulePassedBuilder = widget.validationRulePassedBuilder ??
        getDefaultRulePassedBuilder(widget.value);
    validationRuleNotPassedBuilder = widget.validationRuleNotPassedBuilder ??
        getDefaultRuleNotPassedBuilder(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.validationRules
          .map(
            (rule) => rule.validate(widget.value)
                ? validationRulePassedBuilder(rule.name)
                : validationRuleNotPassedBuilder(rule.name),
          )
          .toList(),
    );
  }

  RuleBuilder getDefaultRulePassedBuilder(String name) => (name) => Chip(
        label: Text(
          name,
          style: const TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
      );

  RuleBuilder getDefaultRuleNotPassedBuilder(String name) => (name) => Chip(
        label: Text(
          name,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
      );
}
