// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/screen/todo/todo_list/todo_list_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i5;

import 'package:flutter_template/model/webservice/todo/todo.dart' as _i4;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i2;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
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

/// A class which mocks [TodoListViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoListViewModel extends _i1.Mock implements _i2.TodoListViewModel {
  MockTodoListViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: false,
      ) as bool);

  @override
  _i3.Stream<List<_i4.Todo>> get dataStream => (super.noSuchMethod(
        Invocation.getter(#dataStream),
        returnValue: _i3.Stream<List<_i4.Todo>>.empty(),
      ) as _i3.Stream<List<_i4.Todo>>);

  @override
  bool get disposed => (super.noSuchMethod(
        Invocation.getter(#disposed),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i3.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> onDownloadClicked() => (super.noSuchMethod(
        Invocation.method(
          #onDownloadClicked,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> onTodoChanged({
    required int? id,
    required bool? value,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #onTodoChanged,
          [],
          {
            #id: id,
            #value: value,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  void onAddClicked() => super.noSuchMethod(
        Invocation.method(
          #onAddClicked,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerDispose(_i6.DisposeAware? toDispose) => super.noSuchMethod(
        Invocation.method(
          #registerDispose,
          [toDispose],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerDisposeStream<T>(_i3.StreamSubscription<T>? subscription) =>
      super.noSuchMethod(
        Invocation.method(
          #registerDisposeStream,
          [subscription],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
