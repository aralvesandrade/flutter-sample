import 'package:com_cingulo_sample/data/accounts/requests/log_in_request.dart';
import 'package:com_cingulo_sample/data/accounts/requests/sign_up_request.dart';
import 'package:com_cingulo_sample/data/api_client/api_client.dart';
import 'package:com_cingulo_sample/data/auth/responses/auth_token_response.dart';
import 'package:inject/inject.dart';

class AccountsApi {
  final ApiClient _apiClient;

  @provide
  @singleton
  AccountsApi(this._apiClient);

  Future<AuthTokenResponse> logIn(LogInRequest request, Function badRequestToModelError) async {
    final response = await _apiClient.post('/accounts/log-in/', request.toJson(), badRequestToModelError);
    return AuthTokenResponse.fromJson(response.data);
  }

  Future<AuthTokenResponse> signUp(SignUpRequest request, Function badRequestToModelError) async {
    final response = await _apiClient.post('/accounts/sign-up/', request.toJson(), badRequestToModelError);
    return AuthTokenResponse.fromJson(response.data);
  }
}
