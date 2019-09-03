import 'package:com_cingulo_sample/errors/model_error.dart';

class AuthTokenModel {
  final String token;
  final String userId;

  AuthTokenModel(this.token, this.userId);
}

class AuthTokenModelError implements ModelError {
  @override
  final String generic;
  final String token;

  AuthTokenModelError({this.generic, this.token});
}
