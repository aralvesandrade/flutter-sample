import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';
import 'package:com_cingulo_sample/screens/home/home_bloc.dart';
import 'package:com_cingulo_sample/screens/home/home_l10n.dart';
import 'package:com_cingulo_sample/widgets/components/cards.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/components/dialogs.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends StatefulWBL<HomeScreen, HomeBloc, HomeL10n> {
  @override
  HomeBloc bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ActionScaffold(
        title: l10n.title,
        actions: _actions(),
        floatingActionButton: _floatingActionButton(),
        body: StreamBuilder(
          stream: bloc.states$,
          builder: (context, snapshot) {
            if (snapshot.data is HomeBlocLoaded) {
              return _body(snapshot.data);
            } else if (snapshot.data is HomeBlocEmpty) {
              return _empty();
            } else {
              return Center(child: Loading());
            }
          },
        ),
      ),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {},
      ),
    ];
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: AppColor.tea,
      onPressed: _openNewTodoListDialog,
    );
  }

  void _openNewTodoListDialog() {
    TextEditingController controller = TextEditingController();
    void submit([_]) {
      print(controller.text);
    }

    DialogDynamic.show(
      context: context,
      title: l10n.dialogTitle,
      content: TextInput(
        labelText: l10n.dialogInputLabel,
        controller: controller,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: submit,
      ),
      actions: [
        ButtonWhite(
          text: l10n.dialogCancelButton,
          onPressed: () => AppRouter.router.pop(context),
        ),
        ButtonPrimary(
          text: l10n.dialogConfirmButton,
          onPressed: submit,
        )
      ],
    );
  }

  Widget _empty() {
    return Center(
      child: Text(l10n.emptyMessage),
    );
  }

  Widget _body(HomeBlocLoaded state) {
    return ListView(
      children: <Widget>[
        ...state.result.list.map((item) => _item(item)).toList(),
      ],
    );
  }

  Widget _item(TodoListsModel item) {
    return CardRegular(
      child: Text(item.name),
    );
  }
}
