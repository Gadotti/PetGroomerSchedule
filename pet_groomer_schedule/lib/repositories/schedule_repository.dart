import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';

class ScheduleRepository {
  
  Future<List<ScheduleController>> getSchedulesList(DateTime date) async {
    final List<ScheduleController> _eventList = [
      new ScheduleController(date, TimeOfDay(hour: 8, minute: 0), "Menina", "Teste > Dia ${date.day}", true),
      new ScheduleController(date, TimeOfDay(hour: 10, minute: 15), "Pépe", "Banho + Hidratação", true),
      new ScheduleController(date, TimeOfDay(hour: 12, minute: 0), "Luke", "Banho", false),
      new ScheduleController(date, TimeOfDay(hour: 14, minute: 0), "Bruce", "Banho", false),
      new ScheduleController(date, TimeOfDay(hour: 16, minute: 0), "Adobe", "Trimming", false),
      new ScheduleController(date, TimeOfDay(hour: 18, minute: 0), "Adobe", "Trimming", false),
    ];

    return _eventList;
  }

  Future update(ScheduleController schedule)
  {

  }
}