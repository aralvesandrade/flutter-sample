import 'dart:async';

import 'package:com_cingulo_sample/data/api_client/api_client.dart';
import 'package:inject/inject.dart';

import 'responses/settings_response.dart';
import 'responses/terms_response.dart';

class CoreApi {
  final ApiClient _apiClient;

  @provide
  @singleton
  CoreApi(this._apiClient);

  Future<TermsResponse> getTerms() async {
    final response = await _apiClient.get('/core/terms/');
    return TermsResponse.fromJson(response.data);
  }

  Future<SettingsResponse> getSettings() async {
    final response = await _apiClient.get('/core/settings/');
    return SettingsResponse.fromJson(response.data);
  }
}
