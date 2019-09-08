import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';
import 'package:com_cingulo_sample/screens/settings/settings_router.dart';
import 'package:com_cingulo_sample/screens/todo/add_task/add_task_dialog.dart';
import 'package:com_cingulo_sample/screens/todo/edit_task/edit_task_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_bloc.dart';
import 'package:com_cingulo_sample/screens/todo/todo_l10n.dart';
import 'package:com_cingulo_sample/widgets/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends StatefulWBL<TodoScreen, TodoBloc, TodoL10n> {
  @override
  final TodoBloc bloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: _appBar(),
        body: StreamBuilder(
          stream: bloc.states$,
          builder: (context, snapshot) {
            if (snapshot.data is TodoBlocData) {
              final tasks = (snapshot.data as TodoBlocData).tasks;
              return tasks.isEmpty ? _empty() : _tasks(tasks);
            }
            return Loading();
          },
        ),
        floatingActionButton: _addTaskButton(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text(l10n.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => SettingsRouter.navigate(context),
        )
      ],
    );
  }

  Widget _empty() {
    return Center(
      child: Text(l10n.empty),
    );
  }

  Widget _tasks(List<TaskModel> tasks) {
    return ListView(
      children: tasks.map((task) => _task(task)).toList(),
    );
  }

  Widget _task(TaskModel task) {
    return Card(
      child: GestureDetector(
        onTap: () => EditTaskRouter.navigate(context, task.id),
        child: ListTile(
          title: Text(task.name),
          subtitle: task.notes == null ? null : task.notes.isEmpty ? null : Text(task.notes),
          trailing: task.done ? Icon(Icons.check, color: Colors.green) : null,
        ),
      ),
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AddTaskDialog(),
      ),
    );
  }
}
