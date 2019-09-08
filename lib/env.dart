import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Env {
  static EnvData _env;
  static EnvData get data => _env;
  static String _appVersion = '0.1.0';
  static String get appVersion => _appVersion;

  static void set(EnvData env) {
    if (_env == null) {
      _env = env;
      _setAppVersion();
    } else {
      throw Exception('Env already set.');
    }
  }

  static void _setAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    Env._appVersion = packageInfo.version;
  }

  static final EnvData dev = EnvData(
    debug: true,
    debugShowCheckedModeBanner: true,
    debugShowMaterialGrid: false,
    debugApiClient: true,
    apiBaseUrl: 'https://api-sample.cingulo.com',
    // apiBaseUrl: 'http://localhost:8000',
    appStoreUrl: '',
    playStoreUrl: '',
    hiringUrl: 'http://dev.cingulo.com',
  );

  static final EnvData prod = EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
    apiBaseUrl: 'https://api-sample.cingulo.com',
    appStoreUrl: '',
    playStoreUrl: '',
    hiringUrl: 'http://dev.cingulo.com',
  );
}

class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;
  final String appStoreUrl;
  final String playStoreUrl;
  final String hiringUrl;

  EnvData({
    @required this.debug,
    @required this.debugShowCheckedModeBanner,
    @required this.debugShowMaterialGrid,
    @required this.debugApiClient,
    @required this.apiBaseUrl,
    @required this.appStoreUrl,
    @required this.playStoreUrl,
    @required this.hiringUrl,
  });
}
