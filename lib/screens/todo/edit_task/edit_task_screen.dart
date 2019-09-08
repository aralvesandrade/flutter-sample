import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';
import 'package:com_cingulo_sample/screens/todo/edit_task/edit_task_bloc.dart';
import 'package:com_cingulo_sample/screens/todo/edit_task/edit_task_l10n.dart';
import 'package:com_cingulo_sample/widgets/buttons.dart';
import 'package:com_cingulo_sample/widgets/dialogs.dart';
import 'package:com_cingulo_sample/widgets/fields.dart';
import 'package:com_cingulo_sample/widgets/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditTaskScreen extends StatefulWidget {
  final String id;

  EditTaskScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    final bloc = EditTaskBloc(id);
    return _EditTaskScreenState(bloc);
  }
}

class _EditTaskScreenState extends StatefulWBL<EditTaskScreen, EditTaskBloc, EditTaskL10n> {
  @override
  final EditTaskBloc bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final FocusNode _notesFocus = FocusNode();
  bool _isProcessing = false;
  bool _loaded = false;
  TaskModel _taskModel;
  TaskModelError _taskModelError;

  _EditTaskScreenState(this.bloc);

  @override
  void initState() {
    super.initState();
    disposableFunctions.addAll([
      _nameController.dispose,
      _notesController.dispose,
      _notesFocus.dispose,
    ]);
    bloc.states$.listen(_onData, onError: _onError);
  }

  void _onData(EditTaskBlocState state) {
    if (state is EditTaskBlocData && _taskModel == null) {
      setState(() {
        _taskModel = state.task;
        _nameController.text = _taskModel.name;
        _notesController.text = _taskModel.notes;
        _loaded = true;
      });
    } else if (state is EditTaskBlocSuccess) {
      AppRouter.router.pop(context);
    }
  }

  void _onError(Object error) {
    setState(() {
      _isProcessing = false;
      _taskModelError = error is TaskModelError ? error : null;
      _formKey.currentState.validate();
    });
  }

  void _onSubmit() {
    if (!_isProcessing) {
      setState(() {
        _isProcessing = true;
        _taskModel
          ..name = _nameController.value.text
          ..notes = _notesController.value.text;
        bloc.update(_taskModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _loaded ? _body() : Loading(),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text(l10n.title),
      actions: <Widget>[
        ButtonClear(
          text: l10n.btnDelete,
          onPressed: () => DialogConfirm.show(
            context,
            l10n.deleteConfirmText,
            () => setState(() {
              _isProcessing = true;
              bloc.delete();
            }),
            title: l10n.deleteConfirmTitle,
            yes: l10n.deleteConfirmBtnYes,
            no: l10n.deleteConfirmBtnNo,
          ),
          themeData: Theme.of(context),
          textColor: Colors.red,
        )
      ],
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextInput(
              labelText: l10n.inputNameLabel,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _nameController,
              validator: (_) => _taskModelError?.name,
              enabled: !_isProcessing,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_notesFocus),
            ),
            TextInput(
              labelText: l10n.inputNotesLabel,
              keyboardType: TextInputType.multiline,
              controller: _notesController,
              enabled: !_isProcessing,
              maxLines: null,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(l10n.checkboxDoneLabel),
                ),
                Checkbox(
                  onChanged: (bool checked) => setState(() => _taskModel.done = checked),
                  value: _taskModel.done,
                ),
              ],
            ),
            Container(height: 16),
            ButtonPrimary(
              text: l10n.btnSave,
              onPressed: _onSubmit,
              themeData: Theme.of(context),
              disabled: _isProcessing,
            ),
          ],
        ),
      ),
    );
  }
}
