import 'package:com_cingulo_sample/data/accounts/requests/sign_up_request.dart';
import 'package:com_cingulo_sample/data/api_client/errors/bad_request_error.dart';
import 'package:com_cingulo_sample/models/accounts/sign_up_model.dart';

class SignUpMapper {
  static SignUpRequest modelToRequest(SignUpModel model) {
    return SignUpRequest(
      fullName: model.fullName,
      username: model.username,
      email: model.email,
      password: model.password,
      language: model.language,
      timeZone: model.timeZone,
      platform: model.platform,
    );
  }

  static SignUpModelError badRequestToModelError(BadRequestError error) {
    return SignUpModelError(
      generic: error.generic(),
      username: error.key('username'),
      fullName: error.key('full_name'),
      email: error.key('email'),
      password: error.key('password'),
    );
  }
}
