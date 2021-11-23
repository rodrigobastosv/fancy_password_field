import 'package:flutter/material.dart';

class DefaultStrengthIndicator extends StatelessWidget {
  const DefaultStrengthIndicator(
    this.strength, {
    Key? key,
  }) : super(key: key);

  final double strength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Text(
          _getPasswordStrengthLabel(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: _getPasswordStrengthColor(),
          ),
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: strength,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getPasswordStrengthColor(),
          ),
          backgroundColor: Colors.white,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  String _getPasswordStrengthLabel() {
    if (strength < .25) {
      return 'Weak';
    } else if (strength < .5) {
      return 'Fair';
    } else if (strength < .75) {
      return 'Good';
    }
    return 'Strong';
  }

  Color _getPasswordStrengthColor() {
    if (strength < .25) {
      return Colors.red;
    } else if (strength < .5) {
      return Colors.yellow;
    } else if (strength < .75) {
      return Colors.blue;
    }
    return Colors.green;
  }
}
