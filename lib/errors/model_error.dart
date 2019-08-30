import 'base_error.dart';

class ModelError implements BaseError {
  final String generic;

  ModelError(this.generic);
}
