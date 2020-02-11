import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/models/schedule.dart';
import 'package:pet_groomer_schedule/repositories/schedule_repository.dart';
import 'package:pet_groomer_schedule/widgets/custom_icon_decoration.dart';
import 'package:pet_groomer_schedule/widgets/edit_schedule_dialog.dart';

class SchedulePage extends StatelessWidget {

  final _scheduleRepository = ScheduleRepository();
  final DateTime _selectedDate;

  SchedulePage(this._selectedDate);

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    //print(' >> build schedule page - date ${_selectedDate.day}');
    var _eventList = _scheduleRepository.getSchedulesList(_selectedDate);    

    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            children: <Widget>[
              _lineStyle(context, iconSize, index, _eventList.length, _eventList[index].isFinish),
              _displayTime(_eventList[index].time),
              _displayContent(context, _eventList[index])
            ],
          ),
        );
      },
    );
  }

  Widget _displayContent(BuildContext _mainContext, Schedule schedule) {
    return Expanded(      
      child: InkWell(
        onLongPress: () {
          showDialog(
              barrierDismissible: false,
              context: _mainContext,
              builder: (BuildContext context) {
                return Dialog(
                    child: EditScheduleDialog(schedule),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    )
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(schedule.task),
                SizedBox(
                  height: 12,
                ),
                Text(schedule.desc)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayTime(String time) {
    return Container(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(time),
        ));
  }

  Widget _lineStyle(BuildContext context, double iconSize, int index,
      int listLength, bool isFinish) {
    return Container(
        decoration: CustomIconDecoration(
            iconSize: iconSize,
            lineWidth: 1,
            firstData: index == 0 ?? true,
            lastData: index == listLength - 1 ?? true),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3),
                    color: Color(0x20000000),
                    blurRadius: 5)
              ]),
          child: Icon(
              isFinish
                  ? Icons.fiber_manual_record
                  : Icons.radio_button_unchecked,
              size: iconSize,
              color: Theme.of(context).accentColor),
        ));
  }
}
