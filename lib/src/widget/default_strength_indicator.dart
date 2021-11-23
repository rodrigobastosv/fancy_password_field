import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';

class DefaultStrengthIndicator extends StatelessWidget {
  const DefaultStrengthIndicator({
    Key? key,
    required this.password,
  }) : super(key: key);

  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: estimatePasswordStrength(password),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
