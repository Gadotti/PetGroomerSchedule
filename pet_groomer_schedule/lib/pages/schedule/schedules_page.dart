import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';
import 'package:pet_groomer_schedule/controllers/schedule_list_controller.dart';
import 'package:pet_groomer_schedule/models/schedule_model.dart';
import 'package:pet_groomer_schedule/pages/schedule/edit_options_dialog.dart';
import 'package:pet_groomer_schedule/pages/schedule/edit_schedule_dialog.dart';
import 'package:pet_groomer_schedule/repositories/schedule_repository.dart';
import 'package:pet_groomer_schedule/widgets/custom_icon_decoration.dart';

class SchedulePage extends StatelessWidget {
  final _scheduleRepository = ScheduleRepository();
  final DateTime selectedDate;
  final GlobalKey<ScaffoldState> globalScaffoldKey;
  final ScheduleListController scheduleListController;
  final Function addSchedule;

  SchedulePage(
    this.selectedDate, 
    this.scheduleListController, 
    this.globalScaffoldKey,
    this.addSchedule
  );

  //TODO: Implementar o esquema de puxar e sugerar para baixo para causar um refresh na tela

  @override
  Widget build(BuildContext context) {
    print(' >> build schedule page - date ${selectedDate.day}');

    return Observer(
      builder: (_) {
        print(' >> items: ${scheduleListController.length}');
        
        if (scheduleListController.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.schedule),
                Text('Nenhum agendamento para esta data.')
              ],
            )
          );
        }

        List<ScheduleController> scheduleControllerList = scheduleListController.schedulesList.toList();
        scheduleControllerList.sort((a, b) => a.timeDouble.compareTo(b.timeDouble));

        return RefreshIndicator(
          onRefresh: () async {            
            final scheduleRepository = ScheduleRepository();
            final listController = await scheduleRepository.getSchedulesList(selectedDate);
            scheduleListController.update(listController);
          },
          child: ListView.builder(
            itemCount: scheduleListController.length,
            padding: const EdgeInsets.all(0),      
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24),
                    child: Observer(
                      builder: (_) {
                        return Row(
                          children: <Widget>[
                            _displayStatus(context, index, scheduleControllerList),
                            _displayTime(scheduleControllerList[index].time.format(context)),
                            _displayTile(context, index, scheduleControllerList)                      
                          ],
                        );
                      },
                    ),
                  ),
                  InkResponse(
                    onTap: () async {
                      var schedule = scheduleControllerList[index];
                      schedule.isFinish = !schedule.isFinish;                      
                      final rowsAffected = await _scheduleRepository.update(schedule);

                      if (rowsAffected <= 0) {
                        globalScaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text('Erro ao realizar atualização!')
                          )
                        ); 
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 70,
                      margin: EdgeInsets.only(top: 15, left: 15),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _displayTile(BuildContext _mainContext, int index, List<ScheduleController> scheduleControllerList) {  
    ScheduleController schedule = scheduleControllerList[index];

    Future<void> _deleteSchedule(ScheduleController schedule) async {
      final rowsAffected = await _scheduleRepository.delete(schedule.id);

      if (rowsAffected > 0) {
        scheduleListController.delete(schedule);
        
        globalScaffoldKey.currentState.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Agendamento excluído!'),
            action: SnackBarAction(
              label: 'Desfazer',
              onPressed: () {}, 
            ),
          )
        );
      } else {
        globalScaffoldKey.currentState.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Erro ao realizar exclusão!')
          )
        ); 
      }
    }

    return Expanded(      
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        onLongPress: () {
          showDialog(
            barrierDismissible: false,
            context: _mainContext,
            builder: (BuildContext _mainContext) {
              return Dialog(
                  child: EditOptionsDialog(schedule, _deleteSchedule),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  )
              );
            });
        },
        onTap: () async {
          var dateBefore = schedule.date;
          // var timeBefore = schedule.time;
          // var taskBefore = schedule.task;

          var scheduleModel = await showDialog<ScheduleModel>(
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

            if (scheduleModel != null) {
              
              final rowsAffected = await _scheduleRepository.update(scheduleModel);
              if (rowsAffected <= 0) {
                globalScaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text('Erro ao realizar atualização!')
                  )
                ); 
              } else {
                if (dateBefore != scheduleModel.date) {
                  scheduleListController.delete(schedule);
                  addSchedule(scheduleModel);
                } 
                // else {
                //   if (timeBefore != scheduleModel.time ||
                //       taskBefore != scheduleModel.task) {
                //       print('>>> vai passar aqui');
                //   }
                // }
              }             
            }
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
                Text(schedule.client),
                SizedBox(
                  height: 12,
                ),
                Text(schedule.task)
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
      )
    );
  }

  Widget _displayStatus(BuildContext context, int index, List<ScheduleController> scheduleControllerList) {
    int listLength = scheduleControllerList.length;
    ScheduleController schedule = scheduleControllerList[index];
    
    return Container(
        decoration: CustomIconDecoration(
            iconSize: 20,
            lineWidth: 1,
            firstData: index == 0 ?? true,
            lastData: index == listLength - 1 ?? true
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  color: Color(0x20000000),
                  blurRadius: 5
              )]
          ),
          child: Observer(
            builder: (_) {
              return Icon(              
                schedule.isFinish
                    ? Icons.fiber_manual_record
                    : Icons.radio_button_unchecked,
                size: 20,
                color: Theme.of(context).accentColor
              );
            }
          ),
        )
    );
  }
}
