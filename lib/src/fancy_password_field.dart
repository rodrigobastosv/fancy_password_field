import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

typedef RuleBuilder = Widget Function(String);

class FancyPasswordField extends StatefulWidget {
  const FancyPasswordField({
    Key? key,
    this.validator,
    this.decoration,
    this.validationRules = const {},
    this.hasStrengthIndicator = true,
    this.validationRulePassedBuilder,
    this.validationRuleNotPassedBuilder,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final Set<ValidationRule> validationRules;
  final bool hasStrengthIndicator;
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
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: hidePassword
                      ? const Icon(
                          Icons.remove_red_eye,
                        )
                      : const Icon(
                          Icons.panorama_fish_eye,
                        ),
                ),
              ),
              obscureText: hidePassword,
          onChanged: (value) {
            this.value = value;
            setState(() {});
          },
          validator: (value) {
            if (widget.validator != null) {
              widget.validator!(value);
            }
          },
        ),
        if (widget.hasStrengthIndicator) ...[
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: estimatePasswordStrength(valueController.text),
          ),
          const SizedBox(height: 12),
        ],
        if (widget.validationRules.isNotEmpty)
          Wrap(
            children: widget.validationRules
                .map(
                  (rule) => rule.validate(value)
                      ? widget.validationRulePassedBuilder!(rule.name)
                      : widget.validationRuleNotPassedBuilder!(rule.name),
                )
                .toList(),
          ),
      ],
    );
  }
}
