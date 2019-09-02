import 'package:dio/dio.dart';
import 'package:inject/inject.dart';

@provide
@singleton
class ApiDio extends Dio {
  /* This class only exist so that we can annotate Dio with @provide and @singleton. */
}
