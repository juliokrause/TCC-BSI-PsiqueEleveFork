// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormStore on _FormStoreBase, Store {
  final _$valueAtom = Atom(name: '_FormStoreBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$errorAtom = Atom(name: '_FormStoreBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_FormStoreBaseActionController =
      ActionController(name: '_FormStoreBase');

  @override
  void setValue(String value) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? error) {
    final _$actionInfo = _$_FormStoreBaseActionController.startAction(
        name: '_FormStoreBase.setError');
    try {
      return super.setError(error);
    } finally {
      _$_FormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
error: ${error}
    ''';
  }
}
