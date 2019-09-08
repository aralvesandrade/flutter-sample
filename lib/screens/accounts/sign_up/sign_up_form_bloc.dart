import 'package:com_cingulo_sample/common/analytics.dart';
import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/accounts/sign_up_model.dart';
import 'package:rxdart/rxdart.dart';

class SignUpFormBloc extends Bloc<SignUpFormBlocState> {
  SignUpFormBloc() : super(states$$: PublishSubject<SignUpFormBlocState>());

  void signUp(SignUpModel model) {
    catchError(() async {
      await di.accountsRepository.signUp(model);
      states$$?.add(SignUpFormBlocSuccess());
      Analytics.log('SignUp: ${model.username}');
    });
  }
}

abstract class SignUpFormBlocState extends BlocState {}

class SignUpFormBlocSuccess extends SignUpFormBlocState {}
