import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    Key? key,
    required bool hidePassword,
    IconData? showPasswordIcon,
    IconData? hidePasswordIcon,
    required Function() onPressed,
  })  : _hidePassword = hidePassword,
        _showPasswordIcon = showPasswordIcon,
        _hidePasswordIcon = hidePasswordIcon,
        _onPressed = onPressed,
        super(key: key);

  final bool _hidePassword;
  final IconData? _showPasswordIcon;
  final IconData? _hidePasswordIcon;
  final Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: _hidePassword
          ? FaIcon(
              _hidePasswordIcon ?? FontAwesomeIcons.eye,
            )
          : Icon(
              _showPasswordIcon ?? FontAwesomeIcons.eyeSlash,
            ),
    );
  }
}
