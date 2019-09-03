import 'dart:convert';

import 'package:com_cingulo_sample/data/api_client/errors/bad_request_error.dart';
import 'package:com_cingulo_sample/data/auth/requests/refresh_token_request.dart';
import 'package:com_cingulo_sample/data/auth/responses/auth_token_response.dart';
import 'package:com_cingulo_sample/models/auth/auth_token_model.dart';

class AuthTokenMapper {
  static String modelToString(AuthTokenModel model) {
    return model.token;
  }

  static AuthTokenModel stringToModel(String token) {
    final parsed = _parseJwt(token);
    final userId = parsed.containsKey('user_id') ? parsed['user_id'] : "";
    return AuthTokenModel(token, userId);
  }

  static AuthTokenModel responseToModel(AuthTokenResponse response) {
    final parsed = _parseJwt(response.token);
    final userId = parsed.containsKey('user_id') ? parsed['user_id'] : "";
    return AuthTokenModel(response.token, userId);
  }

  static RefreshTokenRequest modelToRequest(AuthTokenModel model) {
    return RefreshTokenRequest(model.token);
  }

  static AuthTokenModelError badRequestToModelError(BadRequestError error) {
    return AuthTokenModelError(
      generic: error.generic(),
      token: error.key('token'),
    );
  }

  static Map<String, dynamic> _parseJwt(String token) {
    if (token == null) {
      return {};
    }
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token.');
    }
    String payload = parts[1].replaceAll('-', '+').replaceAll('_', '/');
    switch (payload.length % 4) {
      case 0:
        break;
      case 2:
        payload += '==';
        break;
      case 3:
        payload += '=';
        break;
      default:
        throw Exception('Illegal base64url string."');
    }
    payload = utf8.decode(base64Url.decode(payload));
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload.');
    }
    return payloadMap;
  }
}
