import 'package:flutter/material.dart';
// import 'package:pet_groomer_schedule/controllers/labeled_switch_controller.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
import 'package:pet_groomer_schedule/models/schedule_model.dart';
// import 'package:pet_groomer_schedule/models/schedule.dart';
import 'package:pet_groomer_schedule/widgets/custom_datetime_picker.dart';
import 'package:pet_groomer_schedule/widgets/custom_modal_action_button.dart';
// import 'package:pet_groomer_schedule/widgets/custom_labeled_switch.dart';
import 'package:pet_groomer_schedule/widgets/custom_time_picker.dart';


class EditScheduleDialog extends StatelessWidget {

  final ScheduleModel scheduleModel;
  // final _textClientControler = TextEditingController();
  final _textTaskControler = TextEditingController();
  final _textDateControler = TextEditingController();
  final _textTimeControler = TextEditingController();
  // final _switchFinishController = LabeledSwitchController();

  EditScheduleDialog(this.scheduleModel);
  
  @override
  Widget build(BuildContext context) {

    // _switchFinishController.value = _schedule.isFinish;
    _textTaskControler.text = scheduleModel.task;
    _textDateControler.text = DateTimeHelper.dateToString(scheduleModel.date);
    _textTimeControler.text = scheduleModel.time.format(context);

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(      
            mainAxisSize: MainAxisSize.min,        
            children: <Widget>[
              Center(
                child: Text(
                  scheduleModel.client,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                decoration: InputDecoration(                
                    labelText: 'Serviço'
                ),
                controller: _textTaskControler,
              ),
              // SizedBox(height: 12),
              // CustomLabeledSwitch(
              //   value: _schedule.isFinish,
              //   labelText: 'Finalizado',
              //   controller: _switchFinishController,
              // ),
              SizedBox(height: 12),
              CustomDateTimePicker(
                controller: _textDateControler,
                date: scheduleModel.date,
              ),
              SizedBox(height: 12),

              //TODO: trocar o time:null para passar o time atual e mostrar pré-selecionado
              CustomTimePicker(
                controller: _textTimeControler,
                time: null,
              ),

              SizedBox(
                height: 24,
              ),
              CustomModalActionButton(
                onClose: () {
                  Navigator.of(context).pop(null);
                },
                onSave: () {
                  //TODO: Verificar se houve de fato alguma alteração. Retornar nula se não houver para não haver acesso ao banco de dados
                  scheduleModel.task = _textTaskControler.text;
                  scheduleModel.date = DateTimeHelper.dateFromString(_textDateControler.text);
                  scheduleModel.time = DateTimeHelper.timeOfDayFromString(_textTimeControler.text);
                  
                  Navigator.of(context).pop(scheduleModel);
                },
              )
            ],
          ),
        )
      ],
    );
  }

}