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
  
}