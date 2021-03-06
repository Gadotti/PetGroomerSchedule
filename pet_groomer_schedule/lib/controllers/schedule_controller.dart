//Para atualizar
//=> flutter pub run build_runner build

//https://www.youtube.com/watch?v=7TsBfLjlSZk

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
import 'package:pet_groomer_schedule/models/schedule_model.dart';

part 'schedule_controller.g.dart'; 

class ScheduleController = ScheduleControllerBase with _$ScheduleController;

abstract class ScheduleControllerBase extends ScheduleModel with Store {

  @observable
  @override
  int id;
  
  @observable
  @override
  DateTime date;

  @observable
  @override
  TimeOfDay time;

  @observable
  @override
  String client;

  @observable
  @override
  String task;

  @observable
  @override
  bool isFinish;

  double get timeDouble => time == null ? 0.0 : time.hour + time.minute/60.0;
  
  ScheduleControllerBase({
    @required this.id, 
    @required this.date, 
    @required this.time, 
    @required this.client, 
    @required this.task, 
    @required this.isFinish
  }) : super(
    id: id, 
    date: date, 
    time: time,
    client: client, 
    task: task, 
    isFinish: isFinish);
  
  @action 
  setDate(DateTime value) => date = value;

  @action 
  setTime(TimeOfDay value) => time = value;

  @action 
  setClient(String value) => client = value;

  @action 
  setTask(String value) => task = value;
  
  @action 
  setIsFinish(bool value) => isFinish = value;

  @action
  update(ScheduleModel scheduleModel) {
    date = scheduleModel.date;
    time = scheduleModel.time;
    client = scheduleModel.client;
    task = scheduleModel.task;
    isFinish = scheduleModel.isFinish;
  }

  static ScheduleController fromMap(Map map) {    
    return ScheduleController(
      id: map[ScheduleModel.idColumn],
      date: DateTimeHelper.epochToDateTime(map[ScheduleModel.dateColumn]),
      time: DateTimeHelper.epochToTimeOfDay(map[ScheduleModel.timeColumn]),
      client: map[ScheduleModel.clientColumn],
      task: map[ScheduleModel.taskColumn],
      isFinish: map[ScheduleModel.isFinishColumn] == 1,
    );
  }

  static ScheduleController fromModel(ScheduleModel model) {    
    return ScheduleController(
      id: model.id,
      date: model.date,
      time: model.time,
      client: model.client,
      task: model.task,
      isFinish: model.isFinish,
    );
  }

}