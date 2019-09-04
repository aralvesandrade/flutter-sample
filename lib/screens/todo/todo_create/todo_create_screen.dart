import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_form.dart';
import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_l10n.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/widgets.dart';

class TodoCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoCreateL10n l10n = AppL10n.of<TodoCreateL10n>(context);
    return HeadingButtonsScaffold(
      title: l10n.title,
      leftButtonText: l10n.cancelButton,
      leftButtonOnPressed: () => AppRouter.router.pop(context),
      rightButtonText: l10n.saveButton,
      backgroundColor: AppColor.paleBlue,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.defaultBodyMargin),
        child: TodoCreateForm(),
      ),
    );
  }
}
