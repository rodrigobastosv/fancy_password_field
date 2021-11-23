import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

import 'widget/widget.dart';

typedef StrengthIndicatorBuilder = Widget Function(double strength);

class FancyPasswordField extends StatefulWidget {
  const FancyPasswordField({
    Key? key,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.decoration,
    this.validationRules = const {},
    this.hasShowHidePassword = true,
    this.showPasswordIcon,
    this.hidePasswordIcon,
    this.hasStrengthIndicator = true,
    this.strengthIndicatorBuilder,
    this.validationRulePassedBuilder,
    this.validationRuleNotPassedBuilder,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final InputDecoration? decoration;
  final Set<ValidationRule> validationRules;
  final bool hasShowHidePassword;
  final IconData? showPasswordIcon;
  final IconData? hidePasswordIcon;
  final bool hasStrengthIndicator;
  final StrengthIndicatorBuilder? strengthIndicatorBuilder;
  final RuleBuilder? validationRulePassedBuilder;
  final RuleBuilder? validationRuleNotPassedBuilder;

  @override
  State<FancyPasswordField> createState() => _FancyPasswordFieldState();
}

class _FancyPasswordFieldState extends State<FancyPasswordField> {
  String value = '';
  bool hidePassword = true;
  late TextEditingController valueController;

  @override
  void initState() {
    valueController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: valueController,
          decoration: widget.decoration ??
              InputDecoration(
                suffixIcon: widget.hasShowHidePassword
                    ? DefaultShowHidePasswordButton(
                        hidePassword: hidePassword,
                        showPasswordIcon: widget.showPasswordIcon,
                        hidePasswordIcon: widget.hidePasswordIcon,
                        onPressed: () {
                          setState(() => hidePassword = !hidePassword);
                        },
                      )
                    : null,
              ),
          obscureText: hidePassword,
          onChanged: (changedValue) {
            value = changedValue;
            if (widget.onChanged != null) {
              widget.onChanged!(changedValue);
            }
            setState(() {});
          },
          onSaved: (value) {
            if (widget.onSaved != null) {
              widget.onSaved!(value);
            }
          },
          onFieldSubmitted: (value) {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(value);
            }
          },
          onEditingComplete: () {
            if (widget.onEditingComplete != null) {
              widget.onEditingComplete!();
            }
          },
          validator: (value) {
            if (widget.validator != null) {
              widget.validator!(value);
            }
          },
        ),
        if (widget.hasStrengthIndicator)
          if (widget.strengthIndicatorBuilder != null)
            widget.strengthIndicatorBuilder!(
              estimatePasswordStrength(valueController.text),
            )
          else
            DefaultStrengthIndicator(
              estimatePasswordStrength(valueController.text),
            ),
        if (widget.validationRules.isNotEmpty)
          ValidationRulesWidget(
            value: value,
            validationRules: widget.validationRules,
            validationRulePassedBuilder: widget.validationRulePassedBuilder,
            validationRuleNotPassedBuilder:
                widget.validationRuleNotPassedBuilder,
          ),
      ],
    );
  }
}
