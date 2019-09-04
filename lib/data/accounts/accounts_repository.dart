import 'package:com_cingulo_sample/app/app_di.dart';
import 'package:com_cingulo_sample/data/accounts/accounts_api.dart';
import 'package:com_cingulo_sample/data/accounts/mappers/log_in_mapper.dart';
import 'package:com_cingulo_sample/data/accounts/mappers/sign_up_mapper.dart';
import 'package:com_cingulo_sample/data/auth/auth_repository.dart';
import 'package:com_cingulo_sample/data/auth/mapper/auth_token_mapper.dart';
import 'package:com_cingulo_sample/models/accounts/log_in_model.dart';
import 'package:com_cingulo_sample/models/accounts/sign_up_model.dart';
import 'package:inject/inject.dart';

class AccountsRepository {
  final AccountsApi _accountsApi;
  final AuthRepository _authRepository;

  @provide
  @singleton
  AccountsRepository(this._accountsApi, this._authRepository);

  Future<void> logIn(LogInModel logInModel) async {
    final request = LogInMapper.modelToRequest(logInModel);
    final response = await _accountsApi.logIn(request, LogInMapper.badRequestToModelError);
    final authToken = AuthTokenMapper.responseToModel(response);
    await _authRepository.saveToken(authToken); // Will call onAuthPermission()
    AppDi.reset();
  }

  Future<void> signUp(SignUpModel signUpModel) async {
    final request = SignUpMapper.modelToRequest(signUpModel);
    final response = await _accountsApi.signUp(request, SignUpMapper.badRequestToModelError);
    final authToken = AuthTokenMapper.responseToModel(response);
    await _authRepository.saveToken(authToken); // Will call onAuthPermission()
    AppDi.reset();
  }

  Future<void> logOut() async {
    await _authRepository.deleteToken();
    AppDi.reset();
  }
}
