import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    Key? key,
    required this.hidePassword,
    this.showPasswordIcon,
    this.hidePasswordIcon,
    required this.onPressed,
  }) : super(key: key);

  final bool hidePassword;
  final IconData? showPasswordIcon;
  final IconData? hidePasswordIcon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: hidePassword
          ? FaIcon(
              hidePasswordIcon ?? FontAwesomeIcons.eye,
            )
          : Icon(
              showPasswordIcon ?? FontAwesomeIcons.eyeSlash,
            ),
    );
  }
}
