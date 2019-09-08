import 'dart:async';

import 'package:com_cingulo_sample/common/repository.dart';
import 'package:com_cingulo_sample/data/core/core_api.dart';
import 'package:inject/inject.dart';

class CoreRepository extends Repository {
  final CoreApi _coreApi;

  @provide
  CoreRepository(this._coreApi);

  Future<void> simulateAuthenticationFailed() async {
    await _coreApi.simulateAuthenticationFailed();
  }

  Future<void> simulateInternalServerError() async {
    await _coreApi.simulateInternalServerError();
  }
}
