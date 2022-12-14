// Mocks generated by Mockito 5.3.2 from annotations
// in random_cat/test/data/repositories/cat_repositories_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:random_cat/data/datasources/cat_remote_data_source.dart' as _i3;
import 'package:random_cat/data/models/cat_model.dart' as _i2;

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

class _FakeCatModel_0 extends _i1.SmartFake implements _i2.CatModel {
  _FakeCatModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CatRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCatRemoteDataSource extends _i1.Mock
    implements _i3.CatRemoteDataSource {
  MockCatRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CatModel> getRandomCatImage() => (super.noSuchMethod(
        Invocation.method(
          #getRandomCatImage,
          [],
        ),
        returnValue: _i4.Future<_i2.CatModel>.value(_FakeCatModel_0(
          this,
          Invocation.method(
            #getRandomCatImage,
            [],
          ),
        )),
      ) as _i4.Future<_i2.CatModel>);
}
