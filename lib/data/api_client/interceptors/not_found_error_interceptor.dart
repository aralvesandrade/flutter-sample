import 'package:com_cingulo_sample/data/api_client/errors/not_found_error.dart';
import 'package:dio/dio.dart';

class NotFoundErrorInterceptor extends Interceptor {
  @override
  onError(DioError error) {
    if (error.response != null) {
      if (error.response.statusCode == 404) {
        return NotFoundError();
      }
    }
    return null;
  }
}
