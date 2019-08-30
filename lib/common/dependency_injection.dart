import 'package:com_cingulo_sample/app/app_di.dart';
import 'package:flutter/material.dart';

/*
 * Classes using DependencyInjectionMixin must call 
 * inject() in the constructor.
 */
abstract class DependencyInjectionMixin {
  @protected
  AppDi di;

  @protected
  Future<void> inject() async {
    di = await AppDi.create();
    diReady();
  }

  @protected
  void diReady() {}
}
