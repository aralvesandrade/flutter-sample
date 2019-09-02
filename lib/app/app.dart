import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:com_cingulo_sample/env.dart';
import 'package:com_cingulo_sample/screens/splash/splash_screen.dart';
import 'package:com_cingulo_sample/widgets/styles/colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: Env.data.debugShowCheckedModeBanner,
      debugShowMaterialGrid: Env.data.debugShowMaterialGrid,
      localizationsDelegates: AppL10n.delegates,
      supportedLocales: L10n.locales,
      theme: _themeData(),
      onGenerateTitle: (BuildContext context) => Localizations.of<AppL10n>(context, AppL10n).title,
      onGenerateRoute: AppRouter.router.generator,
      home: SplashScreen(),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.white,
      unselectedWidgetColor: AppColor.tea,
      buttonTheme: ButtonThemeData(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        splashColor: Colors.transparent,
        minWidth: 0,
      ),
    );
  }
}
