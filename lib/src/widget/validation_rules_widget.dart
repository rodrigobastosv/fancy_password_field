import 'package:material_ui/material_ui.dart';

import '../validation_rule.dart';
import 'widget.dart';

typedef ValidationRulesBuilder =
    Widget Function(Set<ValidationRule> rules, String value);

class ValidationRulesWidget extends StatelessWidget {
  const ValidationRulesWidget({
    super.key,
    required this._password,
    required this._validationRules,
    this._validationRuleBuilder,
  });

  final String _password;
  final Set<ValidationRule> _validationRules;
  final ValidationRulesBuilder? _validationRuleBuilder;

  @override
  Widget build(BuildContext context) {
    return _validationRuleBuilder != null
        ? _validationRuleBuilder(_validationRules, _password)
        : DefaultValidationRulesWidget(
            value: _password,
            validationRules: _validationRules,
          );
  }
}
