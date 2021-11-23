import 'package:flutter/material.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    Key? key,
    required this.hidePassword,
    required this.onPressed,
  }) : super(key: key);

  final bool hidePassword;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: hidePassword
          ? const Icon(
              Icons.remove_red_eye,
            )
          : const Icon(
              Icons.panorama_fish_eye,
            ),
    );
  }
}
