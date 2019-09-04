import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';
import 'package:com_cingulo_sample/screens/todo/todo_bloc.dart';
import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_l10n.dart';
import 'package:com_cingulo_sample/widgets/components/cards.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoScreenState();
  }
}

class TodoScreenState extends StatefulWBL<TodoScreen, TodoBloc, TodoL10n> {
  @override
  TodoBloc bloc = TodoBloc();

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
            if (snapshot.data is TodoBlocLoaded) {
              return _body(snapshot.data);
            } else if (snapshot.data is TodoBlocEmpty) {
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
      onPressed: () => TodoCreateRouter.navigate(context),
    );
  }

  Widget _empty() {
    return Center(
      child: Text(l10n.emptyMessage),
    );
  }

  Widget _body(TodoBlocLoaded state) {
    return ListView(
      children: <Widget>[
        ...state.result.list.map((item) => _item(item)).toList(),
      ],
    );
  }

  Widget _item(TodoListsModel item) {
    return CardRegular(
      margin: EdgeInsets.all(Dimens.defaultBodyMargin),
      child: Container(
        padding: EdgeInsets.all(Dimens.defaultBodyMargin),
        color: AppColor.blueGrey,
        child: Text(
          item.name,
          style: TextStyles.SansRegularNegative,
        ),
      ),
    );
  }
}
