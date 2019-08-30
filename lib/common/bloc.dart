import 'package:com_cingulo_sample/common/dependency_injection.dart';
import 'package:com_cingulo_sample/errors/base_error.dart';
import 'package:com_cingulo_sample/errors/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'disposable.dart';

abstract class Bloc<T extends BlocState> with DisposeMixin, DependencyInjectionMixin {
  @protected
  Subject<T> states$$;
  Stream<T> get states$ => states$$.stream;

  Bloc({@required Subject<T> states$$}) {
    this.states$$ = states$$;
    disposableFunctions.addAll([states$$.close, () => this.states$$ = null]);
    init();
  }

  @protected
  @mustCallSuper
  void init() {
    inject();
  }

  @protected
  @override
  @mustCallSuper
  void diReady() {
    catchError(() async => postInit());
  }

  @protected
  void postInit() {}

  @protected
  void catchError(Future<void> Function() run) async {
    try {
      await run();
    } on BaseError catch (error, stackTrace) {
      states$$?.addError(error, stackTrace);
    } catch (error, stackTrace) {
      ErrorHandler.handle(error, stackTrace: stackTrace);
    }
  }
}

abstract class BlocState {}
