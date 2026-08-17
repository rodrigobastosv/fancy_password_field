import 'package:material_ui/material_ui.dart';
import 'package:password_strength/password_strength.dart';

import 'widget.dart';

typedef StrengthIndicatorBuilder = Widget Function(double strength);

class StrengthIndicatorWidget extends StatelessWidget {
  const StrengthIndicatorWidget({
    super.key,
    required this._password,
    this._strengthIndicatorBuilder,
  });

  final String _password;
  final StrengthIndicatorBuilder? _strengthIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return _strengthIndicatorBuilder != null
        ? _strengthIndicatorBuilder(estimatePasswordStrength(_password))
        : DefaultStrengthIndicator(estimatePasswordStrength(_password));
  }
}
