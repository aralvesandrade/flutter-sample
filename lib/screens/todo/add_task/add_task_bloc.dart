import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';
import 'package:rxdart/rxdart.dart';

class AddTaskBloc extends Bloc<AddTaskBlocState> {
  AddTaskBloc() : super(states$$: PublishSubject<AddTaskBlocState>());

  void add(TaskModel task) {
    catchError(() async {
      await di.todoRepository.createTask(task);
      states$$.add(AddTaskBlocSuccess());
    });
  }
}

abstract class AddTaskBlocState extends BlocState {}

class AddTaskBlocSuccess extends AddTaskBlocState {}
