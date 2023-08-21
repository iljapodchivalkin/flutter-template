// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GetXNavigationConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:get/route_manager.dart';

import '../screen/debug/debug_platform_selector_screen.dart' as _i10;
import '../screen/debug/debug_screen.dart' as _i11;
import '../screen/home/home_screen.dart' as _i2;
import '../screen/license/license_screen.dart' as _i5;
import '../screen/login/login_screen.dart' as _i8;
import '../screen/permission/analytics_permission_screen.dart' as _i7;
import '../screen/splash/splash_screen.dart' as _i4;
import '../screen/theme_mode/theme_mode_selector.dart' as _i9;
import '../screen/todo/todo_add/todo_add_screen.dart' as _i6;
import '../widget/general/navigator_page/base_page.dart' as _i1;

class BaseNavigator {
  static final pages = [
    _i1.BasePage<dynamic>(
      name: RouteNames.homeScreen,
      page: () => _i2.HomeScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.splashScreen,
      page: () => _i4.SplashScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.licenseScreen,
      page: () => _i5.LicenseScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.todoAddScreen,
      page: () => _i6.TodoAddScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.analyticsPermissionScreen,
      page: () => _i7.AnalyticsPermissionScreen(
          key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.loginScreen,
      page: () => _i8.LoginScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.themeModeSelectorScreen,
      page: () =>
          _i9.ThemeModeSelectorScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.debugPlatformSelectorScreen,
      page: () => _i10.DebugPlatformSelectorScreen(
          key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.debugScreen,
      page: () => _i11.DebugScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
  ];

  Future<void> goToHomeScreen({_i3.Key? key}) async => Get.offAllNamed<dynamic>(
        RouteNames.homeScreen,
        arguments: {'key': key},
      );
  Future<void> goToSplashScreen({_i3.Key? key}) async =>
      Get.offAllNamed<dynamic>(
        RouteNames.splashScreen,
        arguments: {'key': key},
      );
  Future<void> goToLicenseScreen({_i3.Key? key}) async => Get.toNamed<dynamic>(
        RouteNames.licenseScreen,
        arguments: {'key': key},
      );
  Future<void> goToTodoAddScreen({_i3.Key? key}) async => Get.toNamed<dynamic>(
        RouteNames.todoAddScreen,
        arguments: {'key': key},
      );
  Future<void> goToAnalyticsPermissionScreen({_i3.Key? key}) async =>
      Get.toNamed<dynamic>(
        RouteNames.analyticsPermissionScreen,
        arguments: {'key': key},
      );
  Future<void> goToLoginScreen({_i3.Key? key}) async =>
      Get.offAllNamed<dynamic>(
        RouteNames.loginScreen,
        arguments: {'key': key},
      );
  Future<void> goToThemeModeSelectorScreen({_i3.Key? key}) async =>
      Get.toNamed<dynamic>(
        RouteNames.themeModeSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugPlatformSelectorScreen({_i3.Key? key}) async =>
      Get.toNamed<dynamic>(
        RouteNames.debugPlatformSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugScreen({_i3.Key? key}) async => Get.toNamed<dynamic>(
        RouteNames.debugScreen,
        arguments: {'key': key},
      );
  void goBack<T>({T? result}) => Get.back<T>(result: result);
  Future<T?> showCustomDialog<T>({_i3.Widget? widget}) async =>
      Get.dialog<T>(widget ?? const _i3.SizedBox.shrink());
}

class RouteNames {
  static const homeScreen = '/home-screen';

  static const splashScreen = '/splash-screen';

  static const licenseScreen = '/license-screen';

  static const todoAddScreen = '/todo-add-screen';

  static const analyticsPermissionScreen = '/analytics-permission-screen';

  static const loginScreen = '/login-screen';

  static const themeModeSelectorScreen = '/theme-mode-selector-screen';

  static const debugPlatformSelectorScreen = '/debug-platform-selector-screen';

  static const debugScreen = '/debug-screen';
}
