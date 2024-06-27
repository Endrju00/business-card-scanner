import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'src/app.dart';

void bootstrap() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      di.setup();
      runApp(const App());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
