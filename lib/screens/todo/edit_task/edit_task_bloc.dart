import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';
import 'package:rxdart/rxdart.dart';

class EditTaskBloc extends Bloc<EditTaskBlocState> {
  final String id;

  EditTaskBloc(this.id) : super(states$$: BehaviorSubject<EditTaskBlocState>.seeded(EditTaskBlocLoading()));

  @override
  void postInit() async {
    final task = await di.todoRepository.getTask(id);
    states$$.add(EditTaskBlocData(task));
  }

  void update(TaskModel task) {
    catchError(() async {
      task.id = id;
      await di.todoRepository.updateTask(task);
      states$$.add(EditTaskBlocSuccess());
    });
  }

  void delete() {
    catchError(() async {
      final task = TaskModel(id: id);
      await di.todoRepository.deleteTask(task);
      states$$.add(EditTaskBlocSuccess());
    });
  }
}

abstract class EditTaskBlocState extends BlocState {}

class EditTaskBlocLoading extends EditTaskBlocState {}

class EditTaskBlocData extends EditTaskBlocState {
  final TaskModel task;

  EditTaskBlocData(this.task);
}

class EditTaskBlocSuccess extends EditTaskBlocState {}
