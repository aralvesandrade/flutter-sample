import 'dart:async';

import 'package:com_cingulo_sample/data/api_client/api_client.dart';
import 'package:com_cingulo_sample/data/auth/requests/refresh_token_request.dart';
import 'package:com_cingulo_sample/data/auth/responses/auth_token_response.dart';
import 'package:inject/inject.dart';

class AuthApi {
  final ApiClient _apiClient;

  @provide
  @singleton
  AuthApi(this._apiClient);

  Future<AuthTokenResponse> refreshToken(RefreshTokenRequest request, Function badRequestToModelError) async {
    final response = await _apiClient.post('/accounts/refresh-token/', request.toJson(), badRequestToModelError);
    return AuthTokenResponse.fromJson(response.data);
  }
}
