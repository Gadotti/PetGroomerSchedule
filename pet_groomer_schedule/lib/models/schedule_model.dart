import 'package:flutter/material.dart';

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

  ScheduleModel(this.id, this.date, this.time, this.client, this.task, this.isFinish);
}