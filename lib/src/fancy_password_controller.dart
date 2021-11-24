import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/widgets.dart';

/// This controller is responsible for controlling the state of the password
/// field. This controller gives the widget access to some internal info of
/// the password field, like what are the rules, and what rules are beeing
/// ofended.
class FancyPasswordController extends ChangeNotifier {
  late Set<ValidationRule> _rules;
  final Set<ValidationRule> _ofendingRules = {};

  /// Returns the rules of the [FancyPasswordField]
  List<ValidationRule> get rules => _rules.toList();

  /// Returns the rules that are beeing ofended.
  ///
  /// The controller tries to update these values after each onChanged
  List<ValidationRule> get ofendingRules => _ofendingRules.toList();

  /// Returns whether or not all the rules are ok.
  bool get areAllRulesValidated => _ofendingRules.isEmpty;

  /// Set the internal rules of the controller
  void setRules(Set<ValidationRule> rules) {
    _rules = rules;
  }

  /// Reacts to onChanged of the [FancyPasswordField]
  ///
  /// Every call of onChange tries to update the ofending rules set.
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
