import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    Key? key,
    required bool hidePassword,
    Icon? showPasswordIcon,
    Icon? hidePasswordIcon,
    required Function() onPressed,
  })  : _hidePassword = hidePassword,
        _showPasswordIcon = showPasswordIcon,
        _hidePasswordIcon = hidePasswordIcon,
        _onPressed = onPressed,
        super(key: key);

  final bool _hidePassword;
  final Icon? _showPasswordIcon;
  final Icon? _hidePasswordIcon;
  final Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _onPressed,
          child: _hidePassword
              ? _hidePasswordIcon ??
                  const FaIcon(
                    FontAwesomeIcons.eye,
                  )
              : Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: _showPasswordIcon ??
                      const Icon(
                        FontAwesomeIcons.eyeSlash,
                      ),
                ),
        ),
      ],
    );
  }
}
