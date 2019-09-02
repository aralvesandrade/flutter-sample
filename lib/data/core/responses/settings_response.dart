class SettingsResponse {
  final String appVersionAndroid;
  final String appVersionIos;
  final String appCacheExpiration;

  SettingsResponse({this.appVersionAndroid, this.appVersionIos, this.appCacheExpiration});

  SettingsResponse.fromJson(Map<String, dynamic> json)
      : appVersionAndroid = json['app_version_android'],
        appVersionIos = json['app_version_ios'],
        appCacheExpiration = json['app_cache_expiration'];
}
