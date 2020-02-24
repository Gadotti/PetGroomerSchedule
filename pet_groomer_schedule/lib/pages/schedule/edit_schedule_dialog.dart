import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';
// import 'package:pet_groomer_schedule/controllers/labeled_switch_controller.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
// import 'package:pet_groomer_schedule/models/schedule.dart';
import 'package:pet_groomer_schedule/widgets/custom_datetime_picker.dart';
import 'package:pet_groomer_schedule/widgets/custom_modal_action_button.dart';
// import 'package:pet_groomer_schedule/widgets/custom_labeled_switch.dart';
import 'package:pet_groomer_schedule/widgets/custom_time_picker.dart';


class EditScheduleDialog extends StatelessWidget {

  final ScheduleController _schedule;
  // final _textClientControler = TextEditingController();
  final _textServiceControler = TextEditingController();
  final _textDateControler = TextEditingController();
  final _textTimeControler = TextEditingController();
  // final _switchFinishController = LabeledSwitchController();

  EditScheduleDialog(this._schedule);
  
  @override
  Widget build(BuildContext context) {

    // _switchFinishController.value = _schedule.isFinish;
    _textServiceControler.text = _schedule.task;
    _textDateControler.text = DateTimeHelper.dateToString(_schedule.date);
    _textTimeControler.text = _schedule.time.format(context);

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
                  _schedule.client,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ),

              // SizedBox(
              //   height: 24,
              // ),
              // TextField(
              //     decoration: InputDecoration(                
              //       labelText: 'Cliente'
              //     ),
              //     controller: _textClientControler
              // ),
              SizedBox(
                height: 24,
              ),
              TextField(
                decoration: InputDecoration(                
                    labelText: 'Serviço'
                ),
                controller: _textServiceControler,
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
                date: _schedule.date,
              ),
              SizedBox(height: 12),
              CustomTimePicker(
                controller: _textTimeControler,
                time: null,
              ),

              SizedBox(
                height: 24,
              ),
              CustomModalActionButton(
                onClose: () {
                  Navigator.of(context).pop();
                },
                onSave: () {},
              )
            ],
          ),
        )
      ],
    );
  }

}