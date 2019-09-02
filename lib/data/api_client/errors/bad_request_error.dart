import 'dart:collection';

import 'package:dio/dio.dart';

class BadRequestError extends DioError {
  Map<String, dynamic> errors = HashMap();

  BadRequestError(this.errors);

  String generic() {
    return key('__all__') ?? key('non_field_errors');
  }

  String key(String key) {
    if (errors.containsKey(key)) {
      final error = errors[key];
      if (error is List && error.isNotEmpty) {
        return error[0];
      } else {
        return error;
      }
    }
    return null;
  }
}
