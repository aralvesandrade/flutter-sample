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
    L10n.getPlatformLocale(),
    SampleThemeLight.themeData,
  );

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
