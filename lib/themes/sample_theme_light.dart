import 'package:com_cingulo_sample/themes/material_color.dart';
import 'package:flutter/material.dart';

class SampleThemeLight {
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch: _primarySwatch,
    primaryColor: _primaryColor,
    hintColor: _hintColor,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    unselectedWidgetColor: _unselectedWidgetColor,
    accentColor: _primaryColor,
  );

  static final MaterialColor _primarySwatch = hexColor2MaterialColor(0xFF246BB3);
  static final Color _primaryColor = Color(0xFF246BB3);
  static final Color _hintColor = Color(0xffaaaaaa);
  static final Color _unselectedWidgetColor = Color(0xffcccccc);
  static final Color _scaffoldBackgroundColor = Colors.white;

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: Colors.white,
    elevation: 2,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: _primarySwatch),
    actionsIconTheme: IconThemeData(color: _primarySwatch),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final ButtonThemeData _buttonTheme = ButtonThemeData(
    height: 48,
    padding: EdgeInsets.only(left: 24, right: 24),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
    splashColor: Colors.transparent,
  );
}
