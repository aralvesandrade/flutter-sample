import 'package:com_cingulo_sample/app/app_bloc.dart';
import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/env.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsBloc extends Bloc<SettingsBlocState> {
  SettingsBloc() : super(states$$: PublishSubject<SettingsBlocState>());

  void hiring() async {
    final url = Env.data.hiringUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void simulateExpiredAuthToken() {
    catchError(() async {
      await di.coreRepository.simulateAuthenticationFailed();
    });
  }

  void simulateInternalServerError() {
    catchError(() async {
      await di.coreRepository.simulateInternalServerError();
    });
  }

  void setLanguage(Locale locale) {
    AppBloc().setLocale(locale);
    states$$?.add(SettingsBlocLocaleChanged());
  }

  void setThemeData(ThemeData themeData) {
    AppBloc().setThemeData(themeData);
    states$$?.add(SettingsBlocLocaleChanged());
  }

  void logout() async {
    await di.accountsRepository.logOut();
    states$$?.add(SettingsBlocLoggedOut());
  }
}

abstract class SettingsBlocState extends BlocState {}

class SettingsBlocLocaleChanged extends SettingsBlocState {}

class SettingsBlocLoggedOut extends SettingsBlocState {}
