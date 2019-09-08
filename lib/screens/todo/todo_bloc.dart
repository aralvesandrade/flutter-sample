import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc extends Bloc<TodoBlocState> {
  TodoBloc() : super(states$$: BehaviorSubject<TodoBlocState>.seeded(TodoBlocLoading()));

  @override
  void postInit() {
    disposableFunctions.add(di.todoRepository.tasksUpdated$.listen(_refresh).cancel);
    _refresh();
  }

  void _refresh([_]) {
    catchError(() async {
      final tasks = await di.todoRepository.getTasks();
      states$$?.add(TodoBlocData(tasks));
    });
  }
}

abstract class TodoBlocState extends BlocState {}

class TodoBlocLoading extends TodoBlocState {}

class TodoBlocData extends TodoBlocState {
  final List<TaskModel> tasks;

  TodoBlocData(this.tasks);
}
