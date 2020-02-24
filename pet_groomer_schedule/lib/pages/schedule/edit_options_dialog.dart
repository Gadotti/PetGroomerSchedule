import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';

class EditOptionsDialog extends StatelessWidget {
  final Function onDelete;
  final ScheduleController _schedule;

  EditOptionsDialog(this._schedule, this.onDelete);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              textColor: Theme.of(context).accentColor,
              child: Text('Editar'),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete(_schedule);
              },
              textColor: Theme.of(context).accentColor,
              child: Text('Excluir'),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: Theme.of(context).accentColor,
              child: Text('Voltar'),
            ),
          ),
        ],
      ),
    );
  }
}