// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/viewmodel/todo/todo_add/todo_add_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:drift/drift.dart' as _i6;
import 'package:flutter_template/model/snackbar/snackbar_data.dart' as _i7;
import 'package:flutter_template/model/webservice/todo/todo.dart' as _i4;
import 'package:flutter_template/navigator/main_navigator.dart' as _i5;
import 'package:flutter_template/repository/todo/todo_repository.dart' as _i2;
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

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i2.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i4.Todo>> getTodos() => (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: _i3.Stream<List<_i4.Todo>>.empty(),
      ) as _i3.Stream<List<_i4.Todo>>);

  @override
  _i3.Future<List<_i4.Todo>> fetchTodos() => (super.noSuchMethod(
        Invocation.method(
          #fetchTodos,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Todo>>.value(<_i4.Todo>[]),
      ) as _i3.Future<List<_i4.Todo>>);

  @override
  _i3.Future<void> saveTodo(String? todo) => (super.noSuchMethod(
        Invocation.method(
          #saveTodo,
          [todo],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> setTodoState({
    required int? id,
    required bool? value,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setTodoState,
          [],
          {
            #id: id,
            #value: value,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [MainNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockMainNavigator extends _i1.Mock implements _i5.MainNavigator {
  MockMainNavigator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> goToDatabase(_i6.GeneratedDatabase? db) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToDatabase,
          [db],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  void showErrorWithLocaleKey({
    required String? messageKey,
    String? titleKey,
    List<dynamic>? args,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showErrorWithLocaleKey,
          [],
          {
            #messageKey: messageKey,
            #titleKey: titleKey,
            #args: args,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showError(dynamic error) => super.noSuchMethod(
        Invocation.method(
          #showError,
          [error],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> showCustomSnackBar({
    required String? message,
    String? title,
    _i7.SnackBarStyle? style = _i7.SnackBarStyle.neutral,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSnackBar,
          [],
          {
            #message: message,
            #title: title,
            #style: style,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
