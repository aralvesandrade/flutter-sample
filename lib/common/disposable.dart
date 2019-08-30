import 'package:flutter/cupertino.dart';

/*
 * DisposableMixin 
 * ---------------
 * Meant to be used when extending from a class that already 
 * has a dispose() method. disposable() must be explicitly called
 * inside dispose().
 * 
 * Sample Correct DisposableMixin Usage:
 * SomeClass extends HasDispose with DisposableMixin {
 *   @override
 *   dispose() {
 *     disposable();
 *     ...
 *   }
 * }
 * 
 * DisposeMixin
 * ------------
 * Meant to be used with any class that has not yet declared a
 * dispose method.
 * 
 * Sample Correct DisposeMixin Usage:
 *   SomeClass extends DoesntHaveDispose with DisposeMixin {
 *     // No explicit need to implement or override dispose().
 *   }
 * 
 * Reference
 * ---------
 * https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3
 * 
 * Proof of Problem
 * ----------------
 * Paste the code below at https://dartpad.dartlang.org/
 * 
 * abstract class Dispose {
 *   void dispose() {
 *     print('Dispose.dispose() called');
 *     print('Cannot access State.dispose()');
 *   }
 * }
 * 
 * abstract class State {
 *   void dispose() {
 *     print('This will never be printed.');
 *     print('State.dispose() is obfuscated by Dispose.dispose()');
 *   }
 * }
 * 
 * class Screen extends State with Dispose {
 *   void alternativeAttempt() {
 *     super.dispose();
 *   }
 * }
 * 
 * void main() {
 *   var s = Screen();
 *   s.dispose();
 *   s.alternativeAttempt();
 * }
 * 
 */

abstract class DisposableMixin {
  @protected
  List<Function()> disposableFunctions = [];

  @mustCallSuper
  void disposable() => disposableFunctions = _dispose(disposableFunctions);
}

abstract class DisposeMixin {
  @protected
  List<Function()> disposableFunctions = [];

  @mustCallSuper
  void dispose() => disposableFunctions = _dispose(disposableFunctions);
}

List<Function()> _dispose(List<Function()> disposableFunctions) {
  disposableFunctions.forEach((disposeFunction) {
    try {
      disposeFunction();
    } on Exception {
      // Ignore
    }
  });
  return [];
}
