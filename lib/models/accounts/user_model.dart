import 'package:com_cingulo_sample/errors/model_error.dart';

class UserModel {
  int id;
  String uuid;
  String fullName;
  String shortName;
  UserGender gender;
  String email;
  String languageCode;
  String timeZone;
  String abTest;
  bool receiveEmails;
  bool isPremium;
  bool isStaff;

  String checkPassword;
  String newPassword;

  UserModel({
    this.id,
    this.uuid,
    this.fullName,
    this.shortName,
    this.gender,
    this.email,
    this.languageCode,
    this.timeZone,
    this.abTest,
    this.receiveEmails,
    this.isPremium,
    this.isStaff,
    this.checkPassword,
    this.newPassword,
  });
}

enum UserGender { male, female, unknown }

class UserModelError implements ModelError {
  @override
  final String generic;
  final String fullName;
  final String gender;
  final String email;
  final String languageCode;
  final String timeZone;
  final String receiveEmails;
  final String checkPassword;
  final String newPassword;

  UserModelError({
    this.generic,
    this.fullName,
    this.gender,
    this.email,
    this.languageCode,
    this.timeZone,
    this.receiveEmails,
    this.checkPassword,
    this.newPassword,
  });
}
