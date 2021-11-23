import 'package:flutter/material.dart';

class DefaultStrengthIndicator extends StatelessWidget {
  const DefaultStrengthIndicator(
    this._strength, {
    Key? key,
  }) : super(key: key);

  final double _strength;

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
          value: _strength,
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
    if (_strength < .25) {
      return 'Weak';
    } else if (_strength < .5) {
      return 'Fair';
    } else if (_strength < .75) {
      return 'Good';
    }
    return 'Strong';
  }

  Color _getPasswordStrengthColor() {
    if (_strength < .25) {
      return Colors.red;
    } else if (_strength < .5) {
      return Colors.yellow;
    } else if (_strength < .75) {
      return Colors.blue;
    }
    return Colors.green;
  }
}
