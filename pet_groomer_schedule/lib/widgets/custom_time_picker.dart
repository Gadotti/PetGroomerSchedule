import 'package:flutter/material.dart';
// import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';

class CustomTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final TimeOfDay time;

  CustomTimePicker({
    @required this.controller, 
    @required this.time
  });

  Future _pickTime(BuildContext context) async {
    //  DatePicker.showTimePicker(context,  
    //         showTitleActions: true,  
    //             onChanged: (date) {  
    //              print('change $date');  
    //         }, onConfirm: (date) {  
    //              print('confirm $date');  
    //         }, currentTime: DateTime.now(), locale: LocaleType.pt);

    TimeOfDay timepick = await showTimePicker(
      context: context, 
      initialTime: time ?? TimeOfDay.now()
    );

    if (timepick != null && timepick != time) {
      controller.text = timepick.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(      
      padding: EdgeInsets.zero,
      onPressed: () {
        _pickTime(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.access_time, 
              color: Theme.of(context).accentColor, size: 30
            ),
            SizedBox(width: 12),
            Flexible(
              child: TextField(
                onTap: () {
                  _pickTime(context);
                },
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(                  
                  labelText: 'Hora',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
