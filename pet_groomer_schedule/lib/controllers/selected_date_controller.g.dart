// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_date_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedDateController on SelectedDateControllerBase, Store {
  final _$selectedDateAtom =
      Atom(name: 'SelectedDateControllerBase.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.context.enforceReadPolicy(_$selectedDateAtom);
    _$selectedDateAtom.reportObserved();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.context.conditionallyRunInAction(() {
      super.selectedDate = value;
      _$selectedDateAtom.reportChanged();
    }, _$selectedDateAtom, name: '${_$selectedDateAtom.name}_set');
  }

  final _$SelectedDateControllerBaseActionController =
      ActionController(name: 'SelectedDateControllerBase');

  @override
  void slideDate(int pageIndex) {
    final _$actionInfo =
        _$SelectedDateControllerBaseActionController.startAction();
    try {
      return super.slideDate(pageIndex);
    } finally {
      _$SelectedDateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedDate(DateTime seletedDirectDate) {
    final _$actionInfo =
        _$SelectedDateControllerBaseActionController.startAction();
    try {
      return super.updateSelectedDate(seletedDirectDate);
    } finally {
      _$SelectedDateControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
