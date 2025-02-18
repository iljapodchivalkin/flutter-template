
import 'package:flutter/material.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/extension/theme_mode_extension.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LocalStorage {
  @factoryMethod
  factory LocalStorage(AuthStorage storage, SharedPreferenceStorage preferences, List<String> favoriteMeals) = _LocalStorage;

  Future<void> checkForNewInstallation();

  ThemeMode? getThemeMode();

  bool? get hasAnalyticsPermission;

  Future<void> updateThemeMode(ThemeMode themeMode);

  Future<void> updateHasAnalyticsPermission(bool? permissionGranted);

  Future<List<String>> getFavoriteMeals();

  Future<String> getFavoriteMealById(String id);

  Future<void> addMealToFavorites(String id);

  Future<void> deleteMealFromFavorites(String id);

}

class _LocalStorage implements LocalStorage {
  static const _uninstallCheckKey = 'UNINSTALL_CHECK';
  static const _appearanceThemeKey = 'APPEARANCE_THEME';
  static const _analyticsPermissionKey = 'HAS_ANALYTICS_PERMISSION';

  final AuthStorage _authStorage;
  final SharedPreferenceStorage _sharedPreferences;
  final List<String> _favoriteMeals;

  _LocalStorage(this._authStorage, this._sharedPreferences, this._favoriteMeals);

  @override
  Future<void> checkForNewInstallation() async {
    final result = _sharedPreferences.getBoolean(_uninstallCheckKey);
    if (result == null) {
      await _sharedPreferences.saveBoolean(key: _uninstallCheckKey, value: true);
      await _authStorage.clear();
    }
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async => _sharedPreferences.saveString(
        key: _appearanceThemeKey,
        value: themeMode.stringValue,
      );

  @override
  ThemeMode? getThemeMode() {
    final themeString = _sharedPreferences.getString(_appearanceThemeKey);
    return ThemeMode.values.find((element) => element.stringValue == themeString);
  }

  @override
  Future<void> updateHasAnalyticsPermission(bool? permissionGranted) async {
    if (permissionGranted == null) {
      await _sharedPreferences.deleteKey(_analyticsPermissionKey);
    } else {
      await _sharedPreferences.saveBoolean(key: _analyticsPermissionKey, value: permissionGranted);
    }
  }

  @override
  bool? get hasAnalyticsPermission => _sharedPreferences.getBoolean(_analyticsPermissionKey);


  @override
  Future<List<String>> getFavoriteMeals() async {
    return _favoriteMeals;
  }

  @override
  Future<String> getFavoriteMealById(String id) async {
    final result = _favoriteMeals.firstWhere((itemId) => itemId == id);
    return result;
  }

  @override
  Future<void> addMealToFavorites(String id) async {
    _favoriteMeals.add(id);
  }

  @override
  Future<void> deleteMealFromFavorites(String id) async {
    _favoriteMeals.remove(id);
  }

}
