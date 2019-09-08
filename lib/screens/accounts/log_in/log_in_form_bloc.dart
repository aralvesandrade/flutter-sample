import 'package:com_cingulo_sample/common/analytics.dart';
import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/accounts/log_in_model.dart';
import 'package:rxdart/rxdart.dart';

class LogInFormBloc extends Bloc<LogInFormBlocState> {
  LogInFormBloc() : super(states$$: PublishSubject<LogInFormBlocState>());

  void logIn(LogInModel model) {
    catchError(() async {
      await di.accountsRepository.logIn(model);
      states$$?.add(LogInFormBlocSuccess());
      Analytics.log('LogIn: ${model.username}');
    });
  }
}

abstract class LogInFormBlocState extends BlocState {}

class LogInFormBlocSuccess extends LogInFormBlocState {}
