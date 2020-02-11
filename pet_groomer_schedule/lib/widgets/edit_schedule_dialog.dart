import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/models/schedule.dart';
import 'package:pet_groomer_schedule/widgets/custom_modal_action_button.dart';

class EditScheduleDialog extends StatelessWidget {

  final Schedule _schedule;
  EditScheduleDialog(this._schedule);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
            _schedule.desc,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          SizedBox(
            height: 24,
          ),
          //TextField(),
          SizedBox(height: 12),
          //TextField(),
          SizedBox(height: 12),
          // CustomDateTimePicker(
          //   icon: Icons.date_range,
          //   onPressed: _pickDate,
          //   value: _selectedDate,
          // ),
          // CustomDateTimePicker(
          //   icon: Icons.access_time,
          //   onPressed: _pickTime,
          //   value: _selectedTime,
          // ),
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
    );
  }
}