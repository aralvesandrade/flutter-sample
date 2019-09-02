import 'dart:async';

import 'package:com_cingulo_sample/common/repository.dart';
import 'package:com_cingulo_sample/data/core/core_api.dart';
import 'package:com_cingulo_sample/models/core/settings_model.dart';
import 'package:inject/inject.dart';

import 'mapper/settings_mapper.dart';

class CoreRepository extends Repository {
  final CoreApi _coreApi;

  @provide
  @singleton
  CoreRepository(this._coreApi);

  Future<SettingsModel> getSettings() async {
    // DO NOT CACHE because of Refresh._check()
    final response = await _coreApi.getSettings();
    return SettingsMapper.responseToModel(response);
  }
}
