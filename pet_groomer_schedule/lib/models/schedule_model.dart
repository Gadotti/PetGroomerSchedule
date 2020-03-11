import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';

class ScheduleModel {
  int id;
  DateTime date;
  TimeOfDay time;
  String client;
  String task;
  bool isFinish;

  static const String tableName = "schedules";
  static const String idColumn = "id";
  static const String dateColumn = "date";
  static const String timeColumn = "time";
  static const String clientColumn = "client";
  static const String taskColumn = "task";
  static const String isFinishColumn = "isFinish";

  ScheduleModel({this.id, this.date, this.time, this.client, this.task, this.isFinish});

  Map toMap() {
    print(' >> Está salvando esta data: ${DateTimeHelper.dateTimeToEpoch(date)}.');    
    print(' >> Original dia: ${date.day}.');    
    print(' >> Convertido dia: ${DateTimeHelper.epochToDateTime(DateTimeHelper.dateTimeToEpoch(date)).day}.');    
    print(' >> id $id.');  
    
    Map<String, dynamic> map = {
      ScheduleModel.dateColumn: DateTimeHelper.dateTimeToEpoch(date),
      ScheduleModel.timeColumn: DateTimeHelper.timeOfDayToEpoch(time),
      ScheduleModel.clientColumn: client,
      ScheduleModel.taskColumn: task,
      ScheduleModel.isFinishColumn: isFinish ? 1 : 0
    };

    if (id != null) {
      map[ScheduleModel.idColumn] = id;
    }

    return map;
  }  
}