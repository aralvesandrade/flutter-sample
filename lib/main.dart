import 'package:com_cingulo_sample/app/app.dart';
import 'package:com_cingulo_sample/env.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  _setupEnvironment();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(App()));
}

void _setupEnvironment() {
  if (kReleaseMode || kProfileMode) {
    Env.set(Env.prod);
  } else {
    Env.set(Env.dev);
  }
}
