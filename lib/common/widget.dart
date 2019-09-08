import 'package:com_cingulo_sample/errors/error_handler.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';
import 'disposable.dart';

abstract class StatefulWB<S extends StatefulWidget, B extends Bloc> extends State<S> with DisposableMixin {
  @protected
  B bloc;

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    disposableFunctions.add(bloc.dispose);
    bloc.states$.listen((_) {}, onError: onError);
  }

  @protected
  @override
  @mustCallSuper
  void dispose() {
    disposable();
    super.dispose();
  }

  @protected
  @mustCallSuper
  void onError(Object error) => ErrorHandler.handle(error, context: context);
}

abstract class StatefulWBL<W extends StatefulWidget, B extends Bloc, L> extends StatefulWB<W, B> {
  @protected
  L l10n;

  @protected
  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    l10n ??= Localizations.of<L>(context, L);
  }
}
