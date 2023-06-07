// Mocks generated by Mockito 5.4.1 from annotations
// in gnews/test/parser_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:gnews/src/parser/parser.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Parser].
///
/// See the documentation for Mockito's code generation for more information.
class MockParser extends _i1.Mock implements _i2.Parser {
  @override
  String get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set url(String? _url) => super.noSuchMethod(
        Invocation.setter(
          #url,
          _url,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set querySelectorValue(String? _querySelectorValue) => super.noSuchMethod(
        Invocation.setter(
          #querySelectorValue,
          _querySelectorValue,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<Map<String, dynamic>?> getResponse() => (super.noSuchMethod(
        Invocation.method(
          #getResponse,
          [],
        ),
        returnValue: _i3.Future<Map<String, dynamic>?>.value(),
        returnValueForMissingStub: _i3.Future<Map<String, dynamic>?>.value(),
      ) as _i3.Future<Map<String, dynamic>?>);
  @override
  _i3.Future<Map<String, dynamic>?> generateResponse(dynamic content) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateResponse,
          [content],
        ),
        returnValue: _i3.Future<Map<String, dynamic>?>.value(),
        returnValueForMissingStub: _i3.Future<Map<String, dynamic>?>.value(),
      ) as _i3.Future<Map<String, dynamic>?>);
}
