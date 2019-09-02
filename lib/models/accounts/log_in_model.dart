import 'package:com_cingulo_sample/errors/model_error.dart';

class LogInModel {
  final String email;
  final String password;

  LogInModel(this.email, this.password);
}

class LogInModelError extends LogInModel implements ModelError {
  @override
  final String generic;

  LogInModelError({this.generic, String email, String password}) : super(email, password);
}
