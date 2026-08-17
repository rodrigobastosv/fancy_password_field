import 'package:material_ui/material_ui.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    super.key,
    required this._hidePassword,
    this._showPasswordIcon,
    this._hidePasswordIcon,
    required this._onPressed,
  });

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
              ? _hidePasswordIcon ?? const Icon(Icons.visibility)
              : Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: _showPasswordIcon ?? const Icon(Icons.visibility_off),
                ),
        ),
      ],
    );
  }
}
