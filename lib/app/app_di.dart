import 'package:com_cingulo_sample/data/accounts/accounts_repository.dart';
import 'package:com_cingulo_sample/data/auth/auth_repository.dart';
import 'package:com_cingulo_sample/data/core/core_repository.dart';
import 'package:inject/inject.dart';

import 'app_di.inject.dart' as $gid;

@Injector()
abstract class AppDi {
  CoreRepository get coreRepository;

  AuthRepository get authRepository;

  AccountsRepository get accountsRepository;

  static Future<AppDi> _created;
  static void reset() => _created = null;

  static Future<AppDi> create() {
    _created ??= $gid.AppDi$Injector.create();
    return _created;
  }
}
