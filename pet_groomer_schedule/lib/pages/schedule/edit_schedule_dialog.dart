import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
import 'package:pet_groomer_schedule/models/schedule_model.dart';
import 'package:pet_groomer_schedule/widgets/custom_datetime_picker.dart';
import 'package:pet_groomer_schedule/widgets/custom_modal_action_button.dart';
import 'package:pet_groomer_schedule/widgets/custom_time_picker.dart';


class EditScheduleDialog extends StatelessWidget {

  final ScheduleModel scheduleModel;
  final _textTaskControler = TextEditingController();
  final _textDateControler = TextEditingController();
  final _textTimeControler = TextEditingController();

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
              SizedBox(height: 12),
              CustomDateTimePicker(
                controller: _textDateControler,
                date: scheduleModel.date,
              ),
              SizedBox(height: 12),
              CustomTimePicker(
                controller: _textTimeControler,
                time: scheduleModel.time,
              ),

              SizedBox(
                height: 24,
              ),
              CustomModalActionButton(
                onClose: () {
                  Navigator.of(context).pop(null);
                },
                onSave: () {
                  final date = DateTimeHelper.dateFromString(_textDateControler.text);
                  final time = DateTimeHelper.timeOfDayFromString(_textTimeControler.text);

                  if (scheduleModel.task == _textTaskControler.text &&
                      scheduleModel.date == date &&
                      scheduleModel.time == time) {
                      Navigator.of(context).pop(null);
                  } else {
                    scheduleModel.task = _textTaskControler.text;
                    scheduleModel.date = date;
                    scheduleModel.time = time;                  
                    Navigator.of(context).pop(scheduleModel);
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }

}