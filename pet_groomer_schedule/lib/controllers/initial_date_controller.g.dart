// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_date_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialDateController on InitialDateControllerBase, Store {
  final _$initialDateAtom = Atom(name: 'InitialDateControllerBase.initialDate');

  @override
  DateTime get initialDate {
    _$initialDateAtom.context.enforceReadPolicy(_$initialDateAtom);
    _$initialDateAtom.reportObserved();
    return super.initialDate;
  }

  @override
  set initialDate(DateTime value) {
    _$initialDateAtom.context.conditionallyRunInAction(() {
      super.initialDate = value;
      _$initialDateAtom.reportChanged();
    }, _$initialDateAtom, name: '${_$initialDateAtom.name}_set');
  }

  final _$InitialDateControllerBaseActionController =
      ActionController(name: 'InitialDateControllerBase');

  @override
  void setInitialDate(DateTime newDate) {
    final _$actionInfo =
        _$InitialDateControllerBaseActionController.startAction();
    try {
      return super.setInitialDate(newDate);
    } finally {
      _$InitialDateControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
