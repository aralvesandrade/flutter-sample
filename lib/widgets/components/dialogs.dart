import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';

import 'components_l10n.dart';

class DialogAlert extends AlertDialog {
  static void show({
    @required BuildContext context,
    @required String content,
    @required List<Widget> actions,
    String title,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            title: title == null ? null : Text(title, style: TextStyles.SansBoldSubheading),
            content: Text(content, style: TextStyles.SansRegular),
            actions: actions,
          );
        });
  }
}

class DialogUnknownError extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final l10n = AppL10n.of<ComponentsL10n>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Text(l10n.dialogUnknownErrorTitle, style: TextStyles.SansBoldSubheading),
      content: Text(l10n.dialogUnknownErrorText, style: TextStyles.SansRegular),
      actions: <Widget>[
        ButtonWhite(
          text: l10n.dialogUnknownErrorButton,
          onPressed: () => AppRouter.router.pop(context),
        ),
      ],
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
