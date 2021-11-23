import 'package:fancy_password_field/src/fancy_password_controller.dart';
import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';

import 'widget/widget.dart';

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
    this.validationRuleBuilder,
    this.passwordController,
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
  final ValidationRulesBuilder? validationRuleBuilder;
  final FancyPasswordController? passwordController;

  @override
  State<FancyPasswordField> createState() => _FancyPasswordFieldState();
}

class _FancyPasswordFieldState extends State<FancyPasswordField> {
  String value = '';
  bool hidePassword = true;
  late TextEditingController valueController;
  late FancyPasswordController passwordController;

  @override
  void initState() {
    valueController = TextEditingController();
    passwordController = (widget.passwordController ??
        FancyPasswordController())
      ..setRules(widget.validationRules);
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
            passwordController.onChange(changedValue);
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
              return widget.validator!(value);
            }
          },
        ),
        if (widget.hasStrengthIndicator && value.isNotEmpty)
          StrengthIndicatorWidget(
            password: value,
            strengthIndicatorBuilder: widget.strengthIndicatorBuilder,
          ),
        if (widget.validationRules.isNotEmpty)
          ValidationRulesWidget(
            password: value,
            validationRules: widget.validationRules,
            validationRuleBuilder: widget.validationRuleBuilder,
          ),
      ],
    );
  }
}
