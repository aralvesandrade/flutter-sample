import 'package:com_cingulo_sample/app/app_di.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';

class Refresh extends WidgetsBindingObserver {
  static final Refresh _singleton = Refresh._init();
  factory Refresh() => _singleton;

  String _lastDailyEmitted;

  // Emits an event once a day.
  PublishSubject<void> _daily$$ = PublishSubject<void>();
  Stream<void> get daily$ => _daily$$.stream;

  Refresh._init() {
    _lastDailyEmitted = _getDate();
  }

  String _getDate({int addDays = 0}) {
    final date = DateTime.now().add(Duration(days: addDays));
    final fmt = DateFormat('yyyy-MM-dd');
    return fmt.format(date);
  }

  void _check() async {
    final today = _getDate();
    if (today != _lastDailyEmitted) {
      _lastDailyEmitted = today;
      _daily$$.add(null);
      final di = await AppDi.instance();
      await di.authRepository.refresh();
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        _check();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.suspending:
    }
  }
}
