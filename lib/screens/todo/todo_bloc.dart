import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc extends Bloc<TodoBlocState> {
  TodoBloc() : super(states$$: BehaviorSubject<TodoBlocState>.seeded(TodoBlocLoading()));

  @override
  void postInit() async {
    di.todoRepository.todoUpdated$.listen(_refresh);
    await _refresh();
  }

  Future _refresh([_]) async {
    catchError(() async {
      final response = await di.todoRepository.getTodoList();
      if (response.list.isEmpty) {
        states$$.add(TodoBlocEmpty());
      } else {
        states$$.add(TodoBlocLoaded(response));
      }
    });
  }
}

abstract class TodoBlocState extends BlocState {}

class TodoBlocLoading extends TodoBlocState {}

class TodoBlocEmpty extends TodoBlocState {}

class TodoBlocLoaded extends TodoBlocState {
  final WrapperTodoListsModel result;

  TodoBlocLoaded(this.result);
}
