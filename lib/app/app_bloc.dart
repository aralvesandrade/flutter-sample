import 'dart:io';

import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:com_cingulo_sample/themes/sample_theme_light.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/*
 * This is a special bloc that does not extend common/bloc.dart
 * and does not have a dispose method.
 */
class AppBloc {
  static final AppBloc _singleton = AppBloc._init();
  factory AppBloc() => _singleton;

  static final initialState = AppState(
    _getPlatformLocale(),
    SampleThemeLight.themeData,
  );

  static Locale _getPlatformLocale() {
    final List<String> codes = Platform.localeName.split('_');
    if (codes.length == 2) {
      return Locale(codes[0], codes[1]);
    } else if (codes.length == 1) {
      return Locale(codes[0]);
    } else {
      return L10n.defaultLocale;
    }
  }

  final BehaviorSubject<AppState> _states$$ = BehaviorSubject<AppState>.seeded(initialState);
  Stream<void> get states$ => _states$$.stream;

  AppBloc._init();

  void setLocale(Locale locale) {
    _states$$.add(AppState(locale, _states$$.value.themeData));
  }

  void setThemeData(ThemeData themeData) {
    _states$$.add(AppState(_states$$.value.locale, themeData));
  }
}

class AppState {
  final Locale locale;
  final ThemeData themeData;

  AppState(this.locale, this.themeData);
}
