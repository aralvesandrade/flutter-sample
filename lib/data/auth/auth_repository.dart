import 'dart:async';

import 'package:com_cingulo_sample/common/analytics.dart';
import 'package:com_cingulo_sample/common/disposable.dart';
import 'package:com_cingulo_sample/common/pushes.dart';
import 'package:com_cingulo_sample/data/auth/auth_api.dart';
import 'package:com_cingulo_sample/data/auth/mapper/auth_token_mapper.dart';
import 'package:com_cingulo_sample/errors/error_handler.dart';
import 'package:com_cingulo_sample/errors/model_error.dart';
import 'package:com_cingulo_sample/models/auth/auth_permission_model.dart';
import 'package:com_cingulo_sample/models/auth/auth_token_model.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 * This is the only repository that must not extend Repository because
 * Repository uses it for onAuthPermission and onRefreshDaily.
 */
class AuthRepository with DisposeMixin {
  static final String sharedPrefsAuthTokenKey = 'AuthRepository.authToken';
  final AuthApi _authApi;

  Completer<void> _initialized = Completer<void>();
  Future<void> get initialized => _initialized.future;

  BehaviorSubject<AuthPermissionModel> _permission$$ = BehaviorSubject<AuthPermissionModel>();
  Stream<AuthPermissionModel> get permission$ => _permission$$.stream;

  @provide
  @singleton
  AuthRepository(this._authApi) {
    disposableFunctions.add(_permission$$.close);
    init();
  }

  void init() async {
    await refresh();
    _initialized.complete();
  }

  Future<AuthPermissionModel> refresh() async {
    final current = await getPermission();
    if (current.isAuthenticated) {
      await _refreshToken();
    } else {
      await _refreshPermission();
    }
    final refreshed = await getPermission();
    return refreshed;
  }

  Future<void> _refreshToken() async {
    final oldToken = await getToken();
    final request = AuthTokenMapper.modelToRequest(oldToken);
    try {
      final response = await _authApi.refreshToken(request, AuthTokenMapper.badRequestToModelError);
      final newToken = AuthTokenMapper.responseToModel(response);
      await saveToken(newToken); // Will call _refreshPermission()
    } on ModelError {
      ErrorHandler.handleUnauthenticatedError();
    } catch (error, stackTrace) {
      ErrorHandler.handle(error, stackTrace: stackTrace);
    }
  }

  Future<void> _refreshPermission() async {
    final oldPermission = _permission$$.value;
    final newPermission = await getPermission();
    if (oldPermission != newPermission) {
      _permission$$.add(newPermission);
    }
  }

  Future<AuthPermissionModel> getPermission() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final isAuthenticated = sharedPrefs.containsKey(sharedPrefsAuthTokenKey);
    return AuthPermissionModel(isAuthenticated);
  }

  Future<AuthTokenModel> getToken() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString(sharedPrefsAuthTokenKey);
    final authTokenModel = AuthTokenMapper.stringToModel(token);
    Analytics.identifyUser(authTokenModel);
    Pushes.identifyUser(authTokenModel);
    return authTokenModel;
  }

  Future<void> saveToken(AuthTokenModel authTokenModel) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(sharedPrefsAuthTokenKey, authTokenModel.token);
    await _refreshPermission();
    Analytics.identifyUser(authTokenModel);
    Pushes.identifyUser(authTokenModel);
  }

  Future<void> deleteToken() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.remove(sharedPrefsAuthTokenKey);
    Pushes.clearUser();
  }
}
