//Para atualizar
//=> flutter pub run build_runner build

import 'package:mobx/mobx.dart';
import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';

part 'schedule_list_controller.g.dart'; 

class ScheduleListController = ScheduleListControllerBase with _$ScheduleListController;

abstract class ScheduleListControllerBase with Store {
  @observable
  ObservableList<ScheduleController> schedulesList;
  
  // ScheduleListControllerBase(this.schedulesList); //.asObservable();
  ScheduleListControllerBase(List<ScheduleController> list) {
    schedulesList = list.asObservable();
  }

  @computed
  int get length => schedulesList.length;

  @action
  void add(ScheduleController newSchedule) {
    // final _scheduleController = ScheduleController(newSchedule);
    // schedulesList.add(_scheduleController);
    schedulesList.add(newSchedule);
  }

  @action
  void delete(ScheduleController removedSchedule) {
    schedulesList.remove(removedSchedule);
  }
}