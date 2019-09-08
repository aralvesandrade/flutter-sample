import 'package:flutter/material.dart';

class ButtonPrimary extends FlatButton {
  ButtonPrimary({
    @required String text,
    @required Function onPressed,
    @required ThemeData themeData,
    bool disabled = false,
  }) : super(
          child: Text(text),
          onPressed: disabled ? null : onPressed,
          color: themeData.primaryColor,
          textColor: themeData.primaryTextTheme.button.color,
          disabledColor: themeData.primaryColor.withOpacity(.5),
          disabledTextColor: themeData.primaryTextTheme.button.color,
        );
}

class ButtonClear extends FlatButton {
  ButtonClear({
    @required String text,
    @required Function onPressed,
    @required ThemeData themeData,
    bool enabled = true,
    Color textColor,
  }) : super(
          child: Text(text),
          onPressed: enabled ? onPressed : null,
          color: themeData.primaryColor.withOpacity(0),
          textColor: textColor == null ? themeData.primaryColor : textColor,
          disabledColor: themeData.primaryColor.withOpacity(0),
          disabledTextColor: themeData.primaryColor.withOpacity(.5),
        );
}
