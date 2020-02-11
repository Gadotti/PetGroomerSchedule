import 'package:pet_groomer_schedule/models/schedule.dart';

class ScheduleRepository {

  List<Schedule> getSchedulesList(DateTime date) {
    final List<Schedule> _eventList = [
      new Schedule("08:00", "Teste > Dia ${date.day}", "Menina", true),
      new Schedule("10:00", "Banho + Hidratação", "Pépe", true),
      new Schedule("12:00", "Banho", "Luke", false),
      new Schedule("14:00", "Banho", "Bruce", false),
      new Schedule("16:00", "Trimming", "Adobe", false),
      new Schedule("18:00", "Trimming", "Adobe", false),
    ];

    return _eventList;
  }

}