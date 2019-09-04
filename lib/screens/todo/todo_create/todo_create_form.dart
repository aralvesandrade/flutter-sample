import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/common/widget.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_create_model.dart';
import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_form_bloc.dart';
import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_l10n.dart';
import 'package:com_cingulo_sample/widgets/components/cards.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:flutter/material.dart';

class TodoCreateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoCreateFormState();
  }
}

class TodoCreateFormState extends StatefulWBL<TodoCreateForm, TodoCreateFormBloc, TodoCreateL10n> {
  @override
  TodoCreateFormBloc bloc = TodoCreateFormBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newTodoListFieldController = TextEditingController();
  HeadingButtons _headingButtons;
  bool _isProcessing = false;
  TodoListsCreateModelError _errorModel;

  @override
  void initState() {
    super.initState();
    disposableFunctions.add(_newTodoListFieldController.dispose);
    bloc.states$.listen(_onData, onError: _onError);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_headingButtons == null) {
      _headingButtons = HeadingButtons.of(context);
      final subscription = _headingButtons.rightButtonOnPressed.listen((_) => _onSubmit());
      disposableFunctions.add(subscription.cancel);
    }
  }

  void _onData(TodoCreateFormBlocState state) {
    if (state is TodoCreateFormBlocSuccess) {
      AppRouter.router.pop(context);
    }
  }

  void _onError(Object error) => setState(() {
        _isProcessing = false;
        _errorModel = error is TodoListsCreateModelError ? error : null;
      });

  void _onSubmit() {
    if (!_isProcessing) {
      setState(() {
        _isProcessing = true;
        final model = TodoListsCreateModel(_newTodoListFieldController.value.text);
        bloc.createTodoList(model);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardForm(
      margin: EdgeInsets.all(0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SubheadingDescription(
              title: l10n.formTitle,
              description: l10n.formDescription,
            ),
            Container(height: 8),
            TextInput(
              labelText: l10n.formInputLabel,
              textInputAction: TextInputAction.next,
              controller: _newTodoListFieldController,
              validator: (_) => _errorModel?.name,
              enabled: !_isProcessing,
              onFieldSubmitted: (_) => _onSubmit(),
            ),
          ],
        ),
      ),
    );
  }
}
