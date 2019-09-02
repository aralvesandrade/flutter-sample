import 'package:com_cingulo_sample/data/core/responses/settings_response.dart';
import 'package:com_cingulo_sample/models/core/settings_model.dart';

class SettingsMapper {
  static SettingsModel responseToModel(SettingsResponse response) {
    return SettingsModel(
      appVersionAndroid: response.appVersionAndroid,
      appVersionIos: response.appVersionIos,
      appCacheExpiration: response.appCacheExpiration,
    );
  }
}
