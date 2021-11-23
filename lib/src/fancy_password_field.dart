import 'package:fancy_password_field/src/fancy_password_controller.dart';
import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';

import 'widget/widget.dart';

class FancyPasswordField extends StatefulWidget {
  const FancyPasswordField({
    Key? key,
    this.onChanged,
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

  /// Similarly of the [onChanged] property of the [TextFormField].
  final ValueChanged<String>? onChanged;

  /// Similarly of the [onSaved] property of the [TextFormField].
  final FormFieldSetter<String>? onSaved;

  /// Similarly of the [validator] property of the [TextFormField].
  final FormFieldValidator<String>? validator;

  /// Similarly of the [decoration] property of the [TextFormField].
  /// 
  /// If no [decoration] is null, a default [InputDecoration] will be created
  /// for the widget. This is done basically so we can put the show and hide icons.
  final InputDecoration? decoration;

  /// Set of [ValidationRule] rules.
  /// 
  /// This package comes with a bunch of pre defined commom rules. But feel free to
  /// create youw own [ValidationRule].
  final Set<ValidationRule> validationRules;

  /// Indicates wether the widget will have Show/Hide password feature.
  final bool hasShowHidePassword;

  /// The [IconData] that will be displayed to show the password
  /// Only has effect if [hasShowHidePassword] is set true.
  final IconData? showPasswordIcon;

  /// The [IconData] that will be displayed to hide the password.
  /// 
  /// Only has effect if [hasShowHidePassword] is set true.
  final IconData? hidePasswordIcon;

  /// Wether the widget will show the [StrengthIndicatorWidget]
  final bool hasStrengthIndicator;

  /// A builder to build a widget that will correspond to a strength indicator.
  /// 
  /// Only has effect if [hasStrengthIndicator] is set true.
  final StrengthIndicatorBuilder? strengthIndicatorBuilder;

  /// A builder to build a widget that will show the validation rules.
  /// 
  /// This is great for the user to keep track of which rules are ok and
  /// which are not.
  final ValidationRulesBuilder? validationRuleBuilder;

  /// Instance of [FancyPasswordController].
  /// 
  /// This is usefull when you want to retrieve some information out of the
  /// Widget.
  final FancyPasswordController? passwordController;

  @override
  State<FancyPasswordField> createState() => _FancyPasswordFieldState();
}

class _FancyPasswordFieldState extends State<FancyPasswordField> {
  String _value = '';
  bool _hidePassword = true;
  late TextEditingController _valueController;
  late FancyPasswordController _passwordController;

  @override
  void initState() {
    _valueController = TextEditingController();
    _passwordController = (widget.passwordController ??
        FancyPasswordController())
      ..setRules(widget.validationRules);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _valueController,
          decoration: widget.decoration ??
              InputDecoration(
                suffixIcon: widget.hasShowHidePassword
                    ? DefaultShowHidePasswordButton(
                        hidePassword: _hidePassword,
                        showPasswordIcon: widget.showPasswordIcon,
                        hidePasswordIcon: widget.hidePasswordIcon,
                        onPressed: () {
                          setState(() => _hidePassword = !_hidePassword);
                        },
                      )
                    : null,
              ),
          obscureText: _hidePassword,
          onChanged: (changedValue) {
            _value = changedValue;
            if (widget.onChanged != null) {
              widget.onChanged!(changedValue);
            }
            _passwordController.onChange(changedValue);
            setState(() {});
          },
          onSaved: (value) {
            if (widget.onSaved != null) {
              widget.onSaved!(value);
            }
          },
          validator: (value) {
            if (widget.validator != null) {
              return widget.validator!(value);
            }
          },
        ),
        if (widget.hasStrengthIndicator && _value.isNotEmpty)
          StrengthIndicatorWidget(
            password: _value,
            strengthIndicatorBuilder: widget.strengthIndicatorBuilder,
          ),
        if (widget.validationRules.isNotEmpty)
          ValidationRulesWidget(
            password: _value,
            validationRules: widget.validationRules,
            validationRuleBuilder: widget.validationRuleBuilder,
          ),
      ],
    );
  }
}
