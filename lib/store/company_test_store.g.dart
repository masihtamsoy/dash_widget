// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_test_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyTestStore on _CompanyTestStore, Store {
  final _$valueAtom = Atom(name: '_CompanyTestStore.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CompanyTestStoreActionController =
      ActionController(name: '_CompanyTestStore');

  @override
  void increment() {
    final _$actionInfo = _$_CompanyTestStoreActionController.startAction(
        name: '_CompanyTestStore.increment');
    try {
      return super.increment();
    } finally {
      _$_CompanyTestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
