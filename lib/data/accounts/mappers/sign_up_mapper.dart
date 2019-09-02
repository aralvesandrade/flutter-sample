import 'package:com_cingulo_sample/data/accounts/requests/sign_up_request.dart';
import 'package:com_cingulo_sample/data/api_client/errors/bad_request_error.dart';
import 'package:com_cingulo_sample/models/accounts/sign_up_model.dart';
import 'package:com_cingulo_sample/models/accounts/user_model.dart';

class SignUpMapper {
  static SignUpRequest modelToRequest(SignUpModel model) {
    return SignUpRequest(
      model.fullName,
      model.gender == UserGender.female
          ? SignUpRequest.genderFemale
          : model.gender == UserGender.male ? SignUpRequest.genderMale : SignUpRequest.genderUnknown,
      model.email,
      model.password,
      model.languageCode,
      model.timeZone,
      model.platform,
    );
  }

  static SignUpModelError badRequestToModelError(BadRequestError error) {
    return SignUpModelError(
      generic: error.generic(),
      fullName: error.key('full_name'),
      email: error.key('email'),
      password: error.key('password'),
    );
  }
}
