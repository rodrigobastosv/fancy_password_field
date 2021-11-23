import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

import 'widget.dart';

typedef StrengthIndicatorBuilder = Widget Function(double strength);

class StrengthIndicatorWidget extends StatelessWidget {
  const StrengthIndicatorWidget({
    Key? key,
    required String password,
    StrengthIndicatorBuilder? strengthIndicatorBuilder,
  })  : _password = password,
        _strengthIndicatorBuilder = strengthIndicatorBuilder,
        super(key: key);

  final String _password;
  final StrengthIndicatorBuilder? _strengthIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return _strengthIndicatorBuilder != null
        ? _strengthIndicatorBuilder!(
            estimatePasswordStrength(_password),
          )
        : DefaultStrengthIndicator(
            estimatePasswordStrength(_password),
          );
  }
}
