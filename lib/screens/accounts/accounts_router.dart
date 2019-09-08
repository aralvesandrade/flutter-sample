import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_router.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_router.dart';
import 'package:fluro/fluro.dart';

class AccountsRouter {
  AccountsRouter(Router router) {
    LogInRouter(router);
    SignUpRouter(router);
  }
}
