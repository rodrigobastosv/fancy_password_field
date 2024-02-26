import 'package:flutter/material.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    Key? key,
    required bool hidePassword,
    Widget? showPasswordIcon,
    Widget? hidePasswordIcon,
    required Function() onPressed,
  })  : _hidePassword = hidePassword,
        _showPasswordIcon = showPasswordIcon,
        _hidePasswordIcon = hidePasswordIcon,
        _onPressed = onPressed,
        super(key: key);

  final bool _hidePassword;
  final Widget? _showPasswordIcon;
  final Widget? _hidePasswordIcon;
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
                  const Icon(
                    Icons.visibility,
                  )
              : Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: _showPasswordIcon ??
                      const Icon(
                        Icons.visibility_off,
                      ),
                ),
        ),
      ],
    );
  }
}
