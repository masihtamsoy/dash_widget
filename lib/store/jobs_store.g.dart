// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JobsStore on _JobsStore, Store {
  final _$valueAtom = Atom(name: '_JobsStore.value');

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

  final _$_JobsStoreActionController = ActionController(name: '_JobsStore');

  @override
  void increment() {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.increment');
    try {
      return super.increment();
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
