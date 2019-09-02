import 'dart:io';
import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/accounts/sign_up_model.dart';
import 'package:com_cingulo_sample/models/accounts/user_model.dart';
import 'package:com_cingulo_sample/screens/splash/splash_router.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';

import 'sign_up_form_bloc.dart';
import 'sign_up_l10n.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpFormState();
}

class SignUpFormState extends StatefulWBL<SignUpForm, SignUpFormBloc, SignUpL10n> {
  @override
  final SignUpFormBloc bloc = SignUpFormBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserGender _gender;
  bool _isProcessing = false;
  SignUpModelError _signUpModelError;

  @override
  void initState() {
    super.initState();
    disposableFunctions.addAll([
      _fullNameController.dispose,
      _emailController.dispose,
      _passwordController.dispose,
    ]);
    bloc.states$.listen(_onData, onError: _onError);
  }

  void _onData(SignUpFormBlocState state) {
    if (state is SignUpFormBlocSuccess) {
      SplashRouter.navigate(context);
    }
  }

  void _onError(Object error) {
    setState(() {
      _isProcessing = false;
      _signUpModelError = error is SignUpModelError ? error : null;
      _formKey.currentState.validate();
    });
  }

  void _onSubmit() {
    if (!_isProcessing) {
      setState(() {
        _isProcessing = true;
        final model = SignUpModel(
          _fullNameController.value.text,
          _gender,
          _emailController.value.text,
          _passwordController.value.text,
          SignUpModel.languageCodePtBr,
          SignUpModel.timeZoneASP,
          Platform.isAndroid ? SignUpModel.platformAndroid : SignUpModel.platformIOS,
        );
        bloc.signUp(model);
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
            labelText: l10n.formFullName,
            controller: _fullNameController,
            validator: (_) => _signUpModelError?.fullName,
            enabled: !_isProcessing,
          ),
          GenderInput(onChanged: (UserGender gender) => _gender = gender),
          TextInput(
            labelText: l10n.formEmail,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (_) => _signUpModelError?.email,
            enabled: !_isProcessing,
          ),
          PasswordInput(
            labelText: l10n.formPassword,
            controller: _passwordController,
            validator: (_) => _signUpModelError?.password,
            enabled: !_isProcessing,
          ),
          _signUpModelError?.generic == null
              ? Container()
              : Text(
                  _signUpModelError?.generic,
                  textAlign: TextAlign.center,
                  style: TextStyles.SansError,
                ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ButtonPrimary(
              text: l10n.formSubmit,
              onPressed: _onSubmit,
              disabled: _isProcessing,
            ),
          ),
        ],
      ),
    );
  }
}
