//Para atualizar
//=> flutter pub run build_runner build

import 'package:mobx/mobx.dart';
part 'selected_date_controller.g.dart'; 

class SelectedDateController = SelectedDateControllerBase with _$SelectedDateController;

abstract class SelectedDateControllerBase with Store {  

  int _currentPageIndex;
  DateTime _initialDate;
  int _initialPageIndex;

  get currentPageIndex => _currentPageIndex;

  SelectedDateControllerBase(this._currentPageIndex, this._initialDate) {
    _initialPageIndex = _currentPageIndex;
  }

  DateTime getDateBasedOnPageIndex(int pageIndex) {
    int index = pageIndex - _initialPageIndex;
    //print(' >> getDateBasedOnPageIndex - $index - $pageIndex - $_initialPageIndex - $_initialDate');
    return _initialDate.add(Duration(days: index));
  }

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  void slideDate(int pageIndex) {
    if (_currentPageIndex < pageIndex) {
      selectedDate = selectedDate.add(Duration(days: 1));
    }
    else {
      selectedDate = selectedDate.subtract(Duration(days: 1));
    }

    _currentPageIndex = pageIndex;
  }

  @action
  void updateSelectedDate(DateTime seletedDirectDate) {
    _currentPageIndex = _initialPageIndex;
    selectedDate = seletedDirectDate;
    _initialDate = selectedDate;
    //print(' >> updateSelectedDate - $_currentPageIndex - $selectedDate - $_initialDate');
  }
}

