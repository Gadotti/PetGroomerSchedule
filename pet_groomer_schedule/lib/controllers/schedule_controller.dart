//Para atualizar
//=> flutter pub run build_runner build

//https://www.youtube.com/watch?v=7TsBfLjlSZk

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'schedule_controller.g.dart'; 

class ScheduleController = ScheduleControllerBase with _$ScheduleController;

abstract class ScheduleControllerBase with Store {
  
  @observable
  DateTime date;

  @observable
  TimeOfDay time;

  @observable
  String client;

  @observable
  String task;

  @observable
  bool isFinish;

  ScheduleControllerBase(this.date, this.time, this.client, this.task, this.isFinish);
  
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
}