// Mocks generated by Mockito 5.2.0 from annotations
// in todoapp/test/home_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todoapp/modules/notes/repository/home_repository.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [HomeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRepository extends _i1.Mock implements _i2.HomeRepository {
  MockHomeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> createTask(Map<String, dynamic>? task) =>
      (super.noSuchMethod(Invocation.method(#createTask, [task]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> updateTask(Map<String, dynamic>? task) =>
      (super.noSuchMethod(Invocation.method(#updateTask, [task]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> deleteTask(String? id) =>
      (super.noSuchMethod(Invocation.method(#deleteTask, [id]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}
