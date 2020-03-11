// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleController on ScheduleControllerBase, Store {
  final _$idAtom = Atom(name: 'ScheduleControllerBase.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$dateAtom = Atom(name: 'ScheduleControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$timeAtom = Atom(name: 'ScheduleControllerBase.time');

  @override
  TimeOfDay get time {
    _$timeAtom.context.enforceReadPolicy(_$timeAtom);
    _$timeAtom.reportObserved();
    return super.time;
  }

  @override
  set time(TimeOfDay value) {
    _$timeAtom.context.conditionallyRunInAction(() {
      super.time = value;
      _$timeAtom.reportChanged();
    }, _$timeAtom, name: '${_$timeAtom.name}_set');
  }

  final _$clientAtom = Atom(name: 'ScheduleControllerBase.client');

  @override
  String get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(String value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }

  final _$taskAtom = Atom(name: 'ScheduleControllerBase.task');

  @override
  String get task {
    _$taskAtom.context.enforceReadPolicy(_$taskAtom);
    _$taskAtom.reportObserved();
    return super.task;
  }

  @override
  set task(String value) {
    _$taskAtom.context.conditionallyRunInAction(() {
      super.task = value;
      _$taskAtom.reportChanged();
    }, _$taskAtom, name: '${_$taskAtom.name}_set');
  }

  final _$isFinishAtom = Atom(name: 'ScheduleControllerBase.isFinish');

  @override
  bool get isFinish {
    _$isFinishAtom.context.enforceReadPolicy(_$isFinishAtom);
    _$isFinishAtom.reportObserved();
    return super.isFinish;
  }

  @override
  set isFinish(bool value) {
    _$isFinishAtom.context.conditionallyRunInAction(() {
      super.isFinish = value;
      _$isFinishAtom.reportChanged();
    }, _$isFinishAtom, name: '${_$isFinishAtom.name}_set');
  }

  final _$ScheduleControllerBaseActionController =
      ActionController(name: 'ScheduleControllerBase');

  @override
  dynamic setDate(DateTime value) {
    final _$actionInfo = _$ScheduleControllerBaseActionController.startAction();
    try {
      return super.setDate(value);
    } finally {
      _$ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTime(TimeOfDay value) {
    final _$actionInfo = _$ScheduleControllerBaseActionController.startAction();
    try {
      return super.setTime(value);
    } finally {
      _$ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClient(String value) {
    final _$actionInfo = _$ScheduleControllerBaseActionController.startAction();
    try {
      return super.setClient(value);
    } finally {
      _$ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTask(String value) {
    final _$actionInfo = _$ScheduleControllerBaseActionController.startAction();
    try {
      return super.setTask(value);
    } finally {
      _$ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsFinish(bool value) {
    final _$actionInfo = _$ScheduleControllerBaseActionController.startAction();
    try {
      return super.setIsFinish(value);
    } finally {
      _$ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update(ScheduleModel scheduleModel) {
    final _$actionInfo = _$ScheduleControllerBaseActionController.startAction();
    try {
      return super.update(scheduleModel);
    } finally {
      _$ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
