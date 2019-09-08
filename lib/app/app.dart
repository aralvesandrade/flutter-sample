import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:com_cingulo_sample/common/refresh.dart';
import 'package:com_cingulo_sample/env.dart';
import 'package:com_cingulo_sample/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_bloc.dart';

class App extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      stream: AppBloc().states$,
      initialData: AppBloc.initialState,
      builder: (context, snapshot) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: Env.data.debugShowCheckedModeBanner,
          debugShowMaterialGrid: Env.data.debugShowMaterialGrid,
          localizationsDelegates: AppL10n.delegates,
          supportedLocales: L10n.locales,
          locale: snapshot.data.locale,
          theme: snapshot.data.themeData,
          onGenerateTitle: (BuildContext context) => Localizations.of<AppL10n>(context, AppL10n).title,
          onGenerateRoute: AppRouter.router.generator,
          builder: (context, widget) {
            WidgetsBinding.instance.addObserver(Refresh());
            return widget;
          },
          home: SplashScreen(),
        );
      },
    );
  }
}
