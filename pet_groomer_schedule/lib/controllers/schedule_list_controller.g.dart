// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleListController on ScheduleListControllerBase, Store {
  Computed<int> _$lengthComputed;

  @override
  int get length =>
      (_$lengthComputed ??= Computed<int>(() => super.length)).value;

  final _$schedulesListAtom =
      Atom(name: 'ScheduleListControllerBase.schedulesList');

  @override
  ObservableList<ScheduleController> get schedulesList {
    _$schedulesListAtom.context.enforceReadPolicy(_$schedulesListAtom);
    _$schedulesListAtom.reportObserved();
    return super.schedulesList;
  }

  @override
  set schedulesList(ObservableList<ScheduleController> value) {
    _$schedulesListAtom.context.conditionallyRunInAction(() {
      super.schedulesList = value;
      _$schedulesListAtom.reportChanged();
    }, _$schedulesListAtom, name: '${_$schedulesListAtom.name}_set');
  }

  final _$ScheduleListControllerBaseActionController =
      ActionController(name: 'ScheduleListControllerBase');

  @override
  void update(List<ScheduleController> list) {
    final _$actionInfo =
        _$ScheduleListControllerBaseActionController.startAction();
    try {
      return super.update(list);
    } finally {
      _$ScheduleListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(ScheduleController newSchedule) {
    final _$actionInfo =
        _$ScheduleListControllerBaseActionController.startAction();
    try {
      return super.add(newSchedule);
    } finally {
      _$ScheduleListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(ScheduleController removedSchedule) {
    final _$actionInfo =
        _$ScheduleListControllerBaseActionController.startAction();
    try {
      return super.delete(removedSchedule);
    } finally {
      _$ScheduleListControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
