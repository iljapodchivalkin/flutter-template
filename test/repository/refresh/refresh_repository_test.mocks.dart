// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/repository/refresh/refresh_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart'
    as _i2;
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

/// A class which mocks [AuthStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthStorage extends _i1.Mock implements _i2.AuthStorage {
  MockAuthStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLoggedIn => (super.noSuchMethod(
        Invocation.getter(#isLoggedIn),
        returnValue: false,
      ) as bool);

  @override
  _i3.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<void> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> saveUserCredentials({
    required String? accessToken,
    required String? refreshToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserCredentials,
          [],
          {
            #accessToken: accessToken,
            #refreshToken: refreshToken,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<bool> hasLoggedInUser() => (super.noSuchMethod(
        Invocation.method(
          #hasLoggedInUser,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
