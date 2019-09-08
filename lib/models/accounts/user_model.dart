import 'package:com_cingulo_sample/errors/model_error.dart';

class UserModel {
  String id;
  String email;
  String fullName;
  String shortName;
  String username;
  String language;
  String timeZone;
  bool isPremium;
  bool isStaff;
  bool emailsSubscribed;
  String platform;

  String password;
  String checkPassword;

  UserModel({
    this.id,
    this.email,
    this.fullName,
    this.shortName,
    this.username,
    this.language,
    this.timeZone,
    this.isPremium,
    this.isStaff,
    this.emailsSubscribed,
    this.platform,
    this.password,
    this.checkPassword,
  });
}

class UserModelError implements ModelError {
  @override
  final String generic;
  final String email;
  final String fullName;
  final String username;
  final String language;
  final String timeZone;
  final String emailsSubscribed;
  final String platform;

  final String password;
  final String checkPassword;

  UserModelError({
    this.generic,
    this.email,
    this.fullName,
    this.username,
    this.language,
    this.timeZone,
    this.emailsSubscribed,
    this.platform,
    this.password,
    this.checkPassword,
  });
}
