import 'package:com_cingulo_sample/data/api_client/api_dio.dart';
import 'package:com_cingulo_sample/data/api_client/interceptors/not_found_error_interceptor.dart';
import 'package:com_cingulo_sample/env.dart';
import 'package:com_cingulo_sample/errors/api_error.dart';
import 'package:dio/dio.dart';
import 'package:inject/inject.dart';

import 'errors/bad_request_error.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/bad_request_interceptor.dart';
import 'interceptors/internal_server_error_interceptor.dart';
import 'interceptors/unauthorized_interceptor.dart';

class ApiClient {
  final ApiDio _apiDio;

  @provide
  @singleton
  ApiClient(this._apiDio) {
    _apiDio.options.baseUrl = Env.data.apiBaseUrl;
    _apiDio.options.connectTimeout = Duration(seconds: 10).inMilliseconds;
    _apiDio.options.receiveTimeout = Duration(seconds: 10).inMilliseconds;
    _apiDio.interceptors.add(InternalServerErrorInterceptor());
    _apiDio.interceptors.add(AuthInterceptor());
    _apiDio.interceptors.add(NotFoundErrorInterceptor()); // Must be before BadRequestInterceptor.
    _apiDio.interceptors.add(BadRequestInterceptor());
    _apiDio.interceptors.add(UnauthorizedInterceptor());
    if (Env.data.debugApiClient) {
      _apiDio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
  }

  post(String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await _apiDio.post(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } catch (error) {
      throw ApiError();
    }
  }

  patch(String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await _apiDio.patch(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } catch (error) {
      throw ApiError();
    }
  }

  get(String path) async {
    try {
      return _apiDio.get(path);
    } catch (error) {
      throw ApiError();
    }
  }
}
