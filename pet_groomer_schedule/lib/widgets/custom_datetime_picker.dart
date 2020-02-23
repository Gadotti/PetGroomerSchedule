import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
// import 'package:intl/intl.dart';

class CustomDateTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final DateTime date;

  CustomDateTimePicker({
    @required this.controller, 
    @required this.date
  });

  //DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  //DateTime dateTime = dateFormat.parse("2019-07-19 8:40:23");

  Future _pickDate(BuildContext context) async {
    DateTime datepick = await showDatePicker(
        context: context,
        locale: const Locale("pt", "BR"),
        initialDate: date,
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));

    if (datepick != null && datepick != date) {
      controller.text = DateTimeHelper.dateToString(datepick);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(      
      padding: EdgeInsets.zero,
      onPressed: () {
        _pickDate(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.date_range, 
              color: Theme.of(context).accentColor, size: 30
            ),
            SizedBox(width: 12),
            Flexible(
              child: TextField(
                onTap: () {
                  _pickDate(context);
                },
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(                  
                  labelText: 'Data',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
