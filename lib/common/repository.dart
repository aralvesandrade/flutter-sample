import 'dart:async';

import 'package:com_cingulo_sample/common/dependency_injection.dart';
import 'package:com_cingulo_sample/common/disposable.dart';
import 'package:com_cingulo_sample/common/refresh.dart';
import 'package:com_cingulo_sample/models/auth/auth_permission_model.dart';
import 'package:flutter/widgets.dart';

abstract class Repository with DisposableMixin, DependencyInjectionMixin {
  @protected
  Completer<void> _initialized = Completer<void>();
  Future<void> get initialized => _initialized.future;

  Repository() {
    init();
  }

  @protected
  @mustCallSuper
  void init() {
    inject();
  }

  @override
  @mustCallSuper
  void diReady() async {
    final subsPermission = di.authRepository.permission$.listen(_onAuthPermission);
    final subsDaily = Refresh().daily$.listen((_) => onRefreshDaily());
    disposableFunctions.addAll([subsPermission.cancel, subsDaily.cancel]);
    await di.authRepository.initialized;
    postInit();
  }

  @mustCallSuper
  void postInit() async {
    _initialized.complete();
  }

  void _onAuthPermission(AuthPermissionModel permission) {
    if (_initialized.isCompleted) {
      onAuthPermission(permission);
    }
  }

  @protected
  void onAuthPermission(AuthPermissionModel permission) {}

  @protected
  void onRefreshDaily() {}
}
