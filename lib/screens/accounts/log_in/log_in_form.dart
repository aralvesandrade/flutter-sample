import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/accounts/log_in_model.dart';
import 'package:com_cingulo_sample/screens/splash/splash_router.dart';
import 'package:com_cingulo_sample/widgets/buttons.dart';
import 'package:com_cingulo_sample/widgets/fields.dart';
import 'package:flutter/material.dart';

import 'log_in_form_bloc.dart';
import 'log_in_l10n.dart';

class LogInForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogInFormState();
}

class _LogInFormState extends StatefulWBL<LogInForm, LogInFormBloc, LogInL10n> {
  @override
  final LogInFormBloc bloc = LogInFormBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  bool _isProcessing = false;
  LogInModelError _logInModelError;

  @override
  void initState() {
    super.initState();
    disposableFunctions.addAll([_usernameController.dispose, _passwordController.dispose, _passwordFocus.dispose]);
    bloc.states$.listen(_onData, onError: _onError);
  }

  void _onData(LogInFormBlocState state) {
    if (state is LogInFormBlocSuccess) {
      SplashRouter.navigate(context);
    }
  }

  void _onError(Object error) {
    setState(() {
      _isProcessing = false;
      _logInModelError = error is LogInModelError ? error : null;
      _formKey.currentState.validate();
    });
  }

  void _onSubmit() {
    if (!_isProcessing) {
      setState(() {
        _isProcessing = true;
        final model = LogInModel(
          username: _usernameController.value.text,
          password: _passwordController.value.text,
        );
        bloc.logIn(model);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextInput(
            labelText: l10n.formUsername,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: _usernameController,
            validator: (_) => _logInModelError?.username,
            enabled: !_isProcessing,
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
          ),
          PasswordInput(
            labelText: l10n.formPassword,
            textInputAction: TextInputAction.done,
            controller: _passwordController,
            validator: (_) => _logInModelError?.password,
            enabled: !_isProcessing,
            focusNode: _passwordFocus,
            onFieldSubmitted: (_) => _onSubmit(),
          ),
          Container(height: 24),
          ButtonPrimary(
            text: l10n.formSubmit,
            onPressed: _onSubmit,
            disabled: _isProcessing,
            themeData: Theme.of(context),
          ),
        ],
      ),
    );
  }
}
