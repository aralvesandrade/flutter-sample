import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_router.dart';
import 'package:com_cingulo_sample/screens/home/home_router.dart';
import 'package:com_cingulo_sample/screens/splash/splash_bloc.dart';
import 'package:com_cingulo_sample/widgets/components/dialogs.dart';
import 'package:com_cingulo_sample/widgets/components/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends StatefulWB<SplashScreen, SplashBloc> {
  @override
  final SplashBloc bloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    bloc.states$.listen(_onData);
  }

  void _onData(SplashBlocState state) {
    if (state is SplashBlocAuthenticated) {
      HomeRouter.navigate(context);
    } else if (state is SplashBlocUnauthenticated) {
      LogInRouter.navigate(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Loading(),
      ),
    );
  }
}
