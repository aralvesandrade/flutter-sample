import 'package:com_cingulo_sample/errors/model_error.dart';

class SignUpModel {
  static final String languageEnUs = 'en-US';
  static final String timeZoneASP = 'America/New_York';
  static final String platformAndroid = 'android';
  static final String platformIOS = 'ios';

  final String username;
  final String fullName;
  final String email;
  final String password;
  final String language;
  final String timeZone;
  final String platform;

  SignUpModel({
    this.username,
    this.fullName,
    this.email,
    this.password,
    this.language,
    this.timeZone,
    this.platform,
  });
}

class SignUpModelError implements ModelError {
  @override
  final String generic;
  final String username;
  final String fullName;
  final String email;
  final String password;

  SignUpModelError({
    this.username,
    this.generic,
    this.fullName,
    this.email,
    this.password,
  });
}
