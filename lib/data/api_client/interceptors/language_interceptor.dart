import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:dio/dio.dart';

class LanguageInterceptor extends Interceptor {
  LanguageInterceptor();

  @override
  onRequest(RequestOptions options) {
    final acceptLanguage = L10n.getCurrentLocale().toString().replaceAll('_', '-');
    options.headers['Accept-Language'] = acceptLanguage;
    return options;
  }

  @override
  onError(DioError error) {
    return null;
  }
}
