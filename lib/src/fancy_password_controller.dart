import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/widgets.dart';

class FancyPasswordController extends ChangeNotifier {
  FancyPasswordController();

  late Set<ValidationRule> _rules;
  final Set<ValidationRule> _ofendingRules = {};

  List<ValidationRule> get rules => _rules.toList();
  List<ValidationRule> get ofendingRules => _ofendingRules.toList();
  bool get areAllRulesValidated => _ofendingRules.isEmpty;

  void setRules(Set<ValidationRule> rules) {
    _rules = rules;
  }

  void onChange(String value) {
    _ofendingRules.clear();
    for (final rule in _rules) {
      if (!rule.validate(value)) {
        _ofendingRules.add(rule);
      }
    }
    notifyListeners();
  }
}
