//Para atualizar
//=> flutter pub run build_runner build

import 'package:mobx/mobx.dart';
part 'initial_date_controller.g.dart'; 

class InitialDateController = InitialDateControllerBase with _$InitialDateController;

abstract class InitialDateControllerBase with Store {
  @observable
  DateTime initialDate;
  
  InitialDateControllerBase(this.initialDate);

  @action
  void setInitialDate(DateTime newDate) {
    initialDate = newDate;
  }
}