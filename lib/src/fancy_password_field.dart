import 'package:fancy_password_field/src/fancy_password_controller.dart';
import 'package:fancy_password_field/src/validation_rule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/widget.dart';

class FancyPasswordField extends StatefulWidget {
  const FancyPasswordField({
    Key? key,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.decoration,
    this.validationRules = const {},
    this.hasShowHidePassword = true,
    this.showPasswordIcon,
    this.hidePasswordIcon,
    this.hasStrengthIndicator = true,
    this.strengthIndicatorBuilder,
    this.hasValidationRules = true,
    this.validationRuleBuilder,
    this.passwordController,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
  }) : super(key: key);

  /// Similarly of the [onChanged] property of the [TextFormField].
  final ValueChanged<String>? onChanged;

  /// Similarly of the [onSaved] property of the [TextFormField].
  final FormFieldSetter<String>? onSaved;

  /// Similarly of the [validator] property of the [TextFormField].
  final FormFieldValidator<String>? validator;

  /// Similarly of the [decoration] property of the [TextFormField].
  ///
  /// If no [decoration] is null, a default [InputDecoration] will be created
  /// for the widget. This is done basically so we can put the show and hide icons.
  final InputDecoration? decoration;

  /// Set of [ValidationRule] rules.
  ///
  /// This package comes with a bunch of pre defined commom rules. But feel free to
  /// create youw own [ValidationRule].
  final Set<ValidationRule> validationRules;

  /// Indicates wether the widget will have Show/Hide password feature.
  final bool hasShowHidePassword;

  /// The [IconData] that will be displayed to show the password
  /// Only has effect if [hasShowHidePassword] is set true.
  final IconData? showPasswordIcon;

  /// The [IconData] that will be displayed to hide the password.
  ///
  /// Only has effect if [hasShowHidePassword] is set true.
  final IconData? hidePasswordIcon;

  /// Wether the widget will show the [StrengthIndicatorWidget]
  final bool hasStrengthIndicator;

  /// A builder to build a widget that will correspond to a strength indicator.
  ///
  /// Only has effect if [hasStrengthIndicator] is set true.
  final StrengthIndicatorBuilder? strengthIndicatorBuilder;

  /// Wether the widget will show the [ValidationRulesWidget]
  final bool hasValidationRules;

  /// A builder to build a widget that will show the validation rules.
  ///
  /// This is great for the user to keep track of which rules are ok and
  /// which are not.
  final ValidationRulesBuilder? validationRuleBuilder;

  /// Instance of [FancyPasswordController].
  ///
  /// This is usefull when you want to retrieve some information out of the
  /// Widget.
  final FancyPasswordController? passwordController;

  /// Property of [TextFormField]
  final String? initialValue;

  /// Property of [TextFormField]
  final FocusNode? focusNode;

  /// Property of [TextFormField]
  final TextInputType? keyboardType;

  /// Property of [TextFormField]
  final TextCapitalization textCapitalization;

  /// Property of [TextFormField]
  final TextInputAction? textInputAction;

  /// Property of [TextFormField]
  final TextStyle? style;

  /// Property of [TextFormField]
  final StrutStyle? strutStyle;

  /// Property of [TextFormField]
  final TextDirection? textDirection;

  /// Property of [TextFormField]
  final TextAlign textAlign;

  /// Property of [TextFormField]
  final TextAlignVertical? textAlignVertical;

  /// Property of [TextFormField]
  final bool autofocus;

  /// Property of [TextFormField]
  final bool readOnly;

  /// Property of [TextFormField]
  final ToolbarOptions? toolbarOptions;

  /// Property of [TextFormField]
  final bool? showCursor;

  /// Property of [TextFormField]
  final String obscuringCharacter;

  /// Property of [TextFormField]
  final bool autocorrect;

  /// Property of [TextFormField]
  final SmartDashesType? smartDashesType;

  /// Property of [TextFormField]
  final SmartQuotesType? smartQuotesType;

  /// Property of [TextFormField]
  final bool enableSuggestions;

  /// Property of [TextFormField]
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Property of [TextFormField]
  final int? maxLines;

  /// Property of [TextFormField]
  final int? minLines;

  /// Property of [TextFormField]
  final bool expands;

  /// Property of [TextFormField]
  final int? maxLength;

  /// Property of [TextFormField]
  final GestureTapCallback? onTap;

  /// Property of [TextFormField]
  final VoidCallback? onEditingComplete;

  /// Property of [TextFormField]
  final ValueChanged<String>? onFieldSubmitted;

  /// Property of [TextFormField]
  final List<TextInputFormatter>? inputFormatters;

  /// Property of [TextFormField]
  final bool? enabled;

  /// Property of [TextFormField]
  final double cursorWidth;

  /// Property of [TextFormField]
  final double? cursorHeight;

  /// Property of [TextFormField]
  final Radius? cursorRadius;

  /// Property of [TextFormField]
  final Color? cursorColor;

  /// Property of [TextFormField]
  final Brightness? keyboardAppearance;

  /// Property of [TextFormField]
  final EdgeInsets scrollPadding;

  /// Property of [TextFormField]
  final bool enableInteractiveSelection;

  /// Property of [TextFormField]
  final TextSelectionControls? selectionControls;

  /// Property of [TextFormField]
  final InputCounterWidgetBuilder? buildCounter;

  /// Property of [TextFormField]
  final ScrollPhysics? scrollPhysics;

  /// Property of [TextFormField]
  final Iterable<String>? autofillHints;

  /// Property of [TextFormField]
  final AutovalidateMode? autovalidateMode;

  /// Property of [TextFormField]
  final ScrollController? scrollController;

  /// Property of [TextFormField]
  final String? restorationId;

  /// Property of [TextFormField]
  final bool enableIMEPersonalizedLearning;

  @override
  State<FancyPasswordField> createState() => _FancyPasswordFieldState();
}

class _FancyPasswordFieldState extends State<FancyPasswordField> {
  String _value = '';
  bool _hidePassword = true;
  late TextEditingController _valueController;
  late FancyPasswordController _passwordController;

  @override
  void initState() {
    _valueController = TextEditingController();
    _passwordController = (widget.passwordController ??
        FancyPasswordController())
      ..setRules(widget.validationRules);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: widget.decoration ??
              InputDecoration(
                suffixIcon: widget.hasShowHidePassword
                    ? DefaultShowHidePasswordButton(
                        hidePassword: _hidePassword,
                        showPasswordIcon: widget.showPasswordIcon,
                        hidePasswordIcon: widget.hidePasswordIcon,
                        onPressed: () {
                          setState(() => _hidePassword = !_hidePassword);
                        },
                      )
                    : null,
              ),
          obscureText: _hidePassword,
          onChanged: (changedValue) {
            _value = changedValue;
            if (widget.onChanged != null) {
              widget.onChanged!(changedValue);
            }
            _passwordController.onChange(changedValue);
            setState(() {});
          },
          onSaved: (value) {
            if (widget.onSaved != null) {
              widget.onSaved!(value);
            }
          },
          validator: (value) {
            if (widget.validator != null) {
              return widget.validator!(value);
            }
          },
          initialValue: widget.initialValue,
          controller: _valueController,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textDirection: widget.textDirection,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          toolbarOptions: widget.toolbarOptions,
          showCursor: widget.showCursor,
          obscuringCharacter: widget.obscuringCharacter,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          keyboardAppearance: widget.keyboardAppearance,
          scrollPadding: widget.scrollPadding,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          buildCounter: widget.buildCounter,
          scrollPhysics: widget.scrollPhysics,
          autofillHints: widget.autofillHints,
          autovalidateMode: widget.autovalidateMode,
          scrollController: widget.scrollController,
          restorationId: widget.restorationId,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        ),
        if (widget.hasStrengthIndicator && _value.isNotEmpty)
          StrengthIndicatorWidget(
            password: _value,
            strengthIndicatorBuilder: widget.strengthIndicatorBuilder,
          ),
        if (widget.hasValidationRules && widget.validationRules.isNotEmpty)
          ValidationRulesWidget(
            password: _value,
            validationRules: widget.validationRules,
            validationRuleBuilder: widget.validationRuleBuilder,
          ),
      ],
    );
  }
}
