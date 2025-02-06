import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:flutter_template/util/web/app_configurator.dart' if (dart.library.html) 'package:flutter_template/util/web/app_configurator_web.dart';

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) async {
  PlatformDispatcher.instance.onError = (error, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      FlutterTemplateLogger.logError('Uncaught platform error', error: error, stackTrace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(trace);
    }

    return true; // Handled
  };

  WidgetsFlutterBinding.ensureInitialized();
  configureWebApp();

  await initArchitecture();

  return await appCode();
}
