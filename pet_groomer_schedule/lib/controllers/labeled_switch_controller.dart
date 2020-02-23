//Para atualizar
//=> flutter pub run build_runner build

import 'package:mobx/mobx.dart';
part 'labeled_switch_controller.g.dart'; 

class LabeledSwitchController = LabeledSwitchControllerBase with _$LabeledSwitchController;

abstract class LabeledSwitchControllerBase with Store {
  LabeledSwitchControllerBase({this.value});  
  
  @observable
  bool value; 

  @action
  void changeValue(bool newValue) {
    value = newValue;
  }
}