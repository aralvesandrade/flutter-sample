import 'package:com_cingulo_sample/errors/model_error.dart';

class LogInModel {
  final String username;
  final String password;

  LogInModel({this.username, this.password});
}

class LogInModelError implements ModelError {
  @override
  final String generic;
  final String username;
  final String password;

  LogInModelError({
    this.generic,
    this.username,
    this.password,
  });
}
