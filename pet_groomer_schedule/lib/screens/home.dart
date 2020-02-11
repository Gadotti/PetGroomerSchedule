import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_groomer_schedule/controllers/initial_date_controller.dart';
import 'package:pet_groomer_schedule/controllers/selected_date_controller.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
import 'package:pet_groomer_schedule/widgets/schedules_page.dart';

class Home extends StatelessWidget {

  static int _initialPageIndex = 30;
  final _pageViewController = PageController(initialPage: _initialPageIndex, keepPage: false); 
  final _initialDateController = InitialDateController(DateTime.now());
  final _selectedDateController = SelectedDateController(_initialPageIndex, DateTime.now());

  Future _pickDate(BuildContext context) async {
    DateTime datepick = await showDatePicker(
        context: context,
        locale: const Locale("pt", "BR"),
        initialDate: _selectedDateController.selectedDate,
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));

    if (datepick == null) {
      return;
    }

    //Ignorar quando a data selecionada é a mesma que já esta na lista sendo apresentada
    if (datepick == _initialDateController.initialDate) {
      return;
    }
    
    _pageViewController.jumpToPage(_initialPageIndex);
    _selectedDateController.updateSelectedDate(datepick); 
    _initialDateController.setInitialDate(datepick);    
  }

  @override
  Widget build(BuildContext context) {
    print('> Buildou a tela...');
    return Scaffold(
      body: Stack(
        children: <Widget>[          
          Container(
            height: 25,
            color: Theme.of(context).accentColor
          ),       
          Positioned(
            right: 0,            
            child: Observer(
              builder: (_) {
                return Text(
                  '${_selectedDateController.selectedDate.day}',
                  style: TextStyle(
                    fontSize: 200,
                    color: Color(0x10000000)
                  )
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              _header(context),
              Observer(
                builder: (_) {
                  return _body(context);
                },
              )
              
            ],
          ),
          InkWell(
            onTap: () {
              _pickDate(context);
            },
            child: Container(
              height: 150,            
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Observer(        
        builder: (_) {
          var _selectedWeekDay = DateTimeHelper.getWeekDayPortuguese(_selectedDateController.selectedDate);

          return Text(
            _selectedWeekDay,
            style: TextStyle(
              fontSize: 32, 
              fontWeight: FontWeight.bold
            ),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    print('> passando pelo _body ');
    return Expanded(
      child: PageView.builder(    
        //A key controla o real rebuild do componente e ativa o observer
        key: PageStorageKey<String>('PageView_${_initialDateController.initialDate.toString()}'), 
        pageSnapping: true,
        onPageChanged: (pageIndex) {
          print('> Evento "onPageChanged" ');
          _selectedDateController.slideDate(pageIndex);
        },
        controller: _pageViewController,
        itemBuilder: (context, index) {
          DateTime datePicked = _selectedDateController.getDateBasedOnPageIndex(index);
          print('> Evento "itemBuilder". Day ${datePicked.day} ');
          return SchedulePage(datePicked);
        }
      ),
    );
  }
  
  

}