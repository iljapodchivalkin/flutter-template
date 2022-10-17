import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/web/app_configurator.dart' if (dart.library.html) 'package:flutter_template/util/web/app_configurator_web.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

Future<void> initLocale() async {
  final localization = GetIt.I.get<Localization>();
  final localeRepo = GetIt.I<LocaleRepository>();
  await localization.load(locale: localeRepo.getCustomLocale());
}

Future<void> _setupCrashLogging() async {
  await Firebase.initializeApp();
  if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) unawaited(FirebaseCrashlytics.instance.sendUnsentReports());
  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    originalOnError?.call(errorDetails);
  };
}

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureWebApp();
    await _setupCrashLogging();
    await initArchitecture();

    return await appCode();
  }, (object, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      staticLogger.e('Zone error', error: object, trace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(object);
      // ignore: avoid_print
      print(trace);
    }

    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      FirebaseCrashlytics.instance.recordError(object, trace);
    }
  });
}

bool updateAppTheme() {
  if (!FlavorConfig.instance.isThemingSupported) return false;

  final flutterTemplateTheme = getIt.get<FlutterTemplateTheme>();
  final localStorage = getIt.get<LocalStorage>();

  var themeMode = FlavorConfig.instance.themeMode;
  if (localStorage.getThemeMode() != null) {
    themeMode = localStorage.getThemeMode()!;
  }
  if (themeMode == ThemeMode.system) {
    final brightness = GetIt.I<Brightness>();
    themeMode = (brightness == Brightness.dark) ? ThemeMode.dark : ThemeMode.light;
  }
  return flutterTemplateTheme.configureForThemeStyle(themeMode == ThemeMode.dark ? FlutterTemplateThemeStyle.dark : FlutterTemplateThemeStyle.light);
}
