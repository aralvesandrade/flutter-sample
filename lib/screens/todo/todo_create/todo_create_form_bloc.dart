import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_create_model.dart';
import 'package:rxdart/rxdart.dart';

class TodoCreateFormBloc extends Bloc<TodoCreateFormBlocState> {
  TodoCreateFormBloc() : super(states$$: PublishSubject<TodoCreateFormBlocState>());

  void createTodoList(TodoListsCreateModel model) async {
    catchError(() async {
      await di.todoRepository.createTodoList(model);
      states$$.add(TodoCreateFormBlocSuccess());
    });
  }
}

abstract class TodoCreateFormBlocState extends BlocState {}

class TodoCreateFormBlocSuccess extends TodoCreateFormBlocState {}
