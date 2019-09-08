import 'package:com_cingulo_sample/data/api_client/api_dio.dart';
import 'package:com_cingulo_sample/data/api_client/errors/bad_request_error.dart';
import 'package:com_cingulo_sample/data/api_client/errors/unauthorized_error.dart';
import 'package:com_cingulo_sample/data/api_client/interceptors/auth_interceptor.dart';
import 'package:com_cingulo_sample/data/api_client/interceptors/bad_request_interceptor.dart';
import 'package:com_cingulo_sample/data/api_client/interceptors/internal_server_error_interceptor.dart';
import 'package:com_cingulo_sample/data/api_client/interceptors/unauthorized_interceptor.dart';
import 'package:com_cingulo_sample/env.dart';
import 'package:com_cingulo_sample/errors/api_error.dart';
import 'package:com_cingulo_sample/errors/unauthenticated_error.dart';
import 'package:dio/dio.dart';
import 'package:inject/inject.dart';

class ApiClient {
  final ApiDio _apiDio;

  @provide
  @singleton
  ApiClient(this._apiDio) {
    _apiDio.options.baseUrl = Env.data.apiBaseUrl;
    _apiDio.options.connectTimeout = Duration(minutes: 3).inMilliseconds;
    _apiDio.options.receiveTimeout = Duration(minutes: 3).inMilliseconds;
    _apiDio.interceptors.add(InternalServerErrorInterceptor());
    _apiDio.interceptors.add(AuthInterceptor());
    _apiDio.interceptors.add(UnauthorizedInterceptor());
    _apiDio.interceptors.add(BadRequestInterceptor());
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
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } catch (error) {
      throw ApiError();
    }
  }

  put(String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await _apiDio.put(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } catch (error) {
      throw ApiError();
    }
  }

  delete(String path) async {
    try {
      return await _apiDio.delete(path);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } catch (error) {
      throw ApiError();
    }
  }

  get(String path) async {
    try {
      return await _apiDio.get(path);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } catch (error) {
      throw ApiError();
    }
  }
}
