import 'package:com_cingulo_sample/errors/model_error.dart';

class SignUpModel {
  static final String languageCodePtBr = 'pt-BR';
  static final String platformIOS = 'ios';
  static final String platformAndroid = 'android';
  static final String timeZoneASP = 'America/Sao_Paulo';

  final String fullName;
  final String username;
  final String email;
  final String password;
  final String languageCode;
  final String timeZone;
  final String platform;

  SignUpModel(this.fullName, this.username, this.email, this.password, this.languageCode, this.timeZone, this.platform);
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
