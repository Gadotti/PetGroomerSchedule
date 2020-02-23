//Para atualizar
//=> flutter pub run build_runner build

import 'package:mobx/mobx.dart';
import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';
import 'package:pet_groomer_schedule/models/schedule.dart';

part 'schedule_list_controller.g.dart'; 

class ScheduleListController = ScheduleListControllerBase with _$ScheduleListController;

abstract class ScheduleListControllerBase with Store {
  @observable
  ObservableList<ScheduleController> schedulesList;
  
  ScheduleListControllerBase(this.schedulesList); //.asObservable();

  @action
  void add(ScheduleController newSchedule) {
    // final _scheduleController = ScheduleController(newSchedule);
    // schedulesList.add(_scheduleController);
    schedulesList.add(newSchedule);
  }
}