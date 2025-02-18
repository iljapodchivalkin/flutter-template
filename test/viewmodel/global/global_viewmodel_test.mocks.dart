// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/viewmodel/global/global_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i4;

import 'package:flutter/material.dart' as _i7;
import 'package:flutter_template/repository/debug/debug_repository.dart' as _i5;
import 'package:flutter_template/repository/locale/locale_repository.dart'
    as _i2;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i6;
import 'package:flutter_template/util/locale/localization_overrides.dart'
    as _i9;
import 'package:flutter_template/util/theme/theme_config.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LocaleRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocaleRepository extends _i1.Mock implements _i2.LocaleRepository {
  MockLocaleRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> setCustomLocale(_i4.Locale? locale) => (super.noSuchMethod(
        Invocation.method(
          #setCustomLocale,
          [locale],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [DebugRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDebugRepository extends _i1.Mock implements _i5.DebugRepository {
  MockDebugRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> saveSlowAnimations({required bool? enabled}) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveSlowAnimations,
          [],
          {#enabled: enabled},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  bool isSlowAnimationsEnabled() => (super.noSuchMethod(
        Invocation.method(
          #isSlowAnimationsEnabled,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i3.Future<void> saveSelectedPlatform(String? selectedPlatform) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveSelectedPlatform,
          [selectedPlatform],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [LocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorage extends _i1.Mock implements _i6.LocalStorage {
  MockLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> checkForNewInstallation() => (super.noSuchMethod(
        Invocation.method(
          #checkForNewInstallation,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateThemeMode(_i7.ThemeMode? themeMode) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateThemeMode,
          [themeMode],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateHasAnalyticsPermission(bool? permissionGranted) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateHasAnalyticsPermission,
          [permissionGranted],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<String>> getFavoriteMeals() => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteMeals,
          [],
        ),
        returnValue: _i3.Future<List<String>>.value(<String>[]),
      ) as _i3.Future<List<String>>);

  @override
  _i3.Future<String?> getFavoriteMealById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteMealById,
          [id],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<void> addMealToFavorites(String? id) => (super.noSuchMethod(
        Invocation.method(
          #addMealToFavorites,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteMealFromFavorites(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteMealFromFavorites,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [ThemeConfigUtil].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeConfigUtil extends _i1.Mock implements _i8.ThemeConfigUtil {
  MockThemeConfigUtil() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.ThemeMode get themeMode => (super.noSuchMethod(
        Invocation.getter(#themeMode),
        returnValue: _i7.ThemeMode.system,
      ) as _i7.ThemeMode);

  @override
  set themeMode(_i7.ThemeMode? _themeMode) => super.noSuchMethod(
        Invocation.setter(
          #themeMode,
          _themeMode,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [LocalizationOverrides].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalizationOverrides extends _i1.Mock
    implements _i9.LocalizationOverrides {
  MockLocalizationOverrides() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> refreshOverrideLocalizations() => (super.noSuchMethod(
        Invocation.method(
          #refreshOverrideLocalizations,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<Map<String, dynamic>> getOverriddenLocalizations(
          _i4.Locale? locale) =>
      (super.noSuchMethod(
        Invocation.method(
          #getOverriddenLocalizations,
          [locale],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);
}
