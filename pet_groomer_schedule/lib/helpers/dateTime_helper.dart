import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {

  static String getWeekDayPortuguese(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:      
        return "Segunda";
      case DateTime.tuesday:
        return "Terça";
      case DateTime.wednesday:
        return "Quarta";
      case DateTime.thursday:
        return "Quinta";
      case DateTime.friday:
        return "Sexta";
      case DateTime.saturday:
        return "Sábado";
      case DateTime.sunday:
        return "Domingo";
      default:
        return "-";
    } 
  }

  static String dateToString(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static DateTime epochToDateTime(int millisecondsEpoch) {
    final date = DateTime.fromMillisecondsSinceEpoch(millisecondsEpoch * 1000);
    return DateTime(date.year, date.month, date.day);
  }

  static int dateTimeToEpoch(DateTime date) {
    final dateWithoutHours = DateTime(date.year, date.month, date.day);
    final sinceEpoch = dateWithoutHours.millisecondsSinceEpoch;
    return (sinceEpoch / 1000).round();
  }

  static int timeOfDayToEpoch(TimeOfDay timeOfDay) {
    final date = DateTime(1969, 1, 1, timeOfDay.hour, timeOfDay.minute);
    final sinceEpoch = date.millisecondsSinceEpoch;
    return (sinceEpoch / 1000).round();
  }

  static TimeOfDay epochToTimeOfDay(int millisecondsEpoch) {
    final date = DateTime.fromMillisecondsSinceEpoch(millisecondsEpoch * 1000);
    return TimeOfDay(hour: date.hour, minute: date.minute);
  }
}