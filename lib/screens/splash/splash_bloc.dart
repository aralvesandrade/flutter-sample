import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:rxdart/rxdart.dart';

class SplashBloc extends Bloc<SplashBlocState> {
  SplashBloc() : super(states$$: BehaviorSubject<SplashBlocState>.seeded(SplashBlocLoading()));

  @override
  void postInit() {
    catchError(() async {
      // TODO: Just a simulation of a wait time. You should remove the next line in a real app.
      await Future.delayed(Duration(seconds: 1));
      final permission = await di.authRepository.getPermission();
      if (permission.isAuthenticated) {
        states$$?.add(SplashBlocAuthenticated());
      } else {
        states$$?.add(SplashBlocUnauthenticated());
      }
    });
  }
}

abstract class SplashBlocState extends BlocState {}

class SplashBlocLoading extends SplashBlocState {}

class SplashBlocAuthenticated extends SplashBlocState {}

class SplashBlocUnauthenticated extends SplashBlocState {}
