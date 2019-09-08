import 'package:com_cingulo_sample/data/api_client/api_client.dart';
import 'package:inject/inject.dart';

class CoreApi {
  final ApiClient _apiClient;

  @provide
  @singleton
  CoreApi(this._apiClient);

  Future<void> simulateAuthenticationFailed() async {
    await _apiClient.get('/core/simulate-authentication-failed/');
  }

  Future<void> simulateInternalServerError() async {
    await _apiClient.get('/core/simulate-internal-server-error/');
  }
}
