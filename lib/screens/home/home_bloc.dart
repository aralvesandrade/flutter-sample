import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc<HomeBlocState> {
  HomeBloc() : super(states$$: BehaviorSubject<HomeBlocState>.seeded(HomeBlocLoading()));

  @override
  void postInit() {
    catchError(() async {
      final response = await di.todoRepository.getTodoList();
      if (response.list.isEmpty) {
        states$$.add(HomeBlocEmpty());
      } else {
        states$$.add(HomeBlocLoaded(response));
      }
    });
  }
}

abstract class HomeBlocState extends BlocState {}

class HomeBlocLoading extends HomeBlocState {}

class HomeBlocEmpty extends HomeBlocState {}

class HomeBlocLoaded extends HomeBlocState {
  final WrapperTodoListsModel result;

  HomeBlocLoaded(this.result);
}
