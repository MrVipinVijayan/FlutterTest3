import 'package:flutter/material.dart';
import 'package:visa_test/constants/color_constants.dart';

class AppTF extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final Color? textFieldColor, iconColor;
  final bool obscureText;
  final double bottomMargin;
  final TextStyle? textStyle, hintStyle;
  final Function? validateFunction;
  final Function? onSaved;
  final Function? onTextChanged;
  final Widget? endIcon;
  final IconData? icon;
  final maxLines;
  final bool isError;
  final bool captializeHint;
  final String? initialValue;

  AppTF({
    this.initialValue,
    this.hintText = '',
    this.isError = false,
    this.obscureText = false,
    this.textInputType,
    this.textFieldColor = Colors.grey,
    this.icon,
    this.iconColor,
    this.bottomMargin = 0.0,
    this.textStyle,
    this.validateFunction,
    this.onSaved,
    this.hintStyle,
    this.onTextChanged,
    this.endIcon,
    this.maxLines = 1,
    this.captializeHint = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin),
        decoration: BoxDecoration(
          border: Border.all(
            color: isError ? errorColor : appGrey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: TextFormField(
            initialValue: initialValue ?? '',
            style: textStyle ?? TextStyle(fontSize: 20.0),
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            validator: (val) {
              if (null != validateFunction) validateFunction!(val);
            },
            onSaved: (val) {
              if (null != onSaved) onSaved!(val);
            },
            maxLines: maxLines,
            onChanged: (val) async {
              if (null != onTextChanged) onTextChanged!(val);
            },
            decoration: InputDecoration(
              labelText: captializeHint ? hintText : hintText,
              fillColor: appGrey,
              labelStyle: TextStyle(color: appGrey, fontSize: 18),
              hintText: captializeHint ? hintText : hintText,
              hintStyle: TextStyle(color: appGrey, fontSize: 18),
              icon: Visibility(
                visible: null != icon,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(
                    icon,
                    color: appGrey,
                  ),
                ),
              ),
              suffixIcon: endIcon ?? null,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
