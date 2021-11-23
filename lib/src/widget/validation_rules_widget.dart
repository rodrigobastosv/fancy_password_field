import 'package:flutter/material.dart';

import '../validation_rule.dart';
import 'widget.dart';

typedef ValidationRulesBuilder = Widget Function(
    Set<ValidationRule> rules, String value);

class ValidationRulesWidget extends StatelessWidget {
  const ValidationRulesWidget({
    Key? key,
    required this.password,
    required this.validationRules,
    this.validationRuleBuilder,
  }) : super(key: key);

  final String password;
  final Set<ValidationRule> validationRules;
  final ValidationRulesBuilder? validationRuleBuilder;

  @override
  Widget build(BuildContext context) {
    return validationRuleBuilder != null ?
            validationRuleBuilder!(
              validationRules,
              password,
            )
          :
            DefaultValidationRulesWidget(
              value: password,
              validationRules: validationRules,
            );
  }
}
