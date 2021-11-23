import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

import 'widget.dart';

typedef StrengthIndicatorBuilder = Widget Function(double strength);

class StrengthIndicatorWidget extends StatelessWidget {
  const StrengthIndicatorWidget({
    Key? key,
    required this.password,
    this.strengthIndicatorBuilder,
  }) : super(key: key);

  final String password;
  final StrengthIndicatorBuilder? strengthIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return strengthIndicatorBuilder != null
        ? strengthIndicatorBuilder!(
            estimatePasswordStrength(password),
          )
        : DefaultStrengthIndicator(
            estimatePasswordStrength(password),
          );
  }
}
