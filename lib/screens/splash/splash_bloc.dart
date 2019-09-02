import 'package:com_cingulo_sample/common/bloc.dart';
import 'package:rxdart/rxdart.dart';

class SplashBloc extends Bloc<SplashBlocState> {
  SplashBloc() : super(states$$: BehaviorSubject<SplashBlocState>.seeded(SplashBlocLoading()));

  @override
  void postInit() {
    catchError(() async {
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
