import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
import 'package:pet_groomer_schedule/models/schedule_model.dart';
import 'package:pet_groomer_schedule/repositories/schedule_repository.dart';
import 'package:pet_groomer_schedule/widgets/custom_modal_action_button.dart';
import 'package:pet_groomer_schedule/widgets/custom_time_picker.dart';

class NewScheduleDialog extends StatelessWidget {

  final DateTime _selectedDate;
  final _textClientControler = TextEditingController();
  final _textServiceControler = TextEditingController();
  final _textTimeControler = TextEditingController();

  NewScheduleDialog(this._selectedDate);

  @override
  Widget build(BuildContext context) {
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
                  DateTimeHelper.dateToString(_selectedDate),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                  decoration: InputDecoration(                
                    labelText: 'Cliente'
                  ),
                  controller: _textClientControler
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                decoration: InputDecoration(                
                    labelText: 'Serviço'
                ),
                controller: _textServiceControler,
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
                  Navigator.of(context).pop(null);
                },
                onSave: () async {
                  final schedule = ScheduleModel(
                    date: _selectedDate,
                    client: _textClientControler.text,
                    task: _textServiceControler.text,
                    time: DateTimeHelper.timeOfDayFromString(_textTimeControler.text),
                    isFinish: false
                  );

                  final repo = ScheduleRepository();
                  schedule.id = await repo.insert(schedule);

                  Navigator.of(context).pop(schedule);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}