import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

class CalendarScrollerViewModel extends ChangeNotifier {
  late DateTime _dateTime;
  late int _selectedDayIndex;
  late int _selectedMonth;
  late List<DateTime> _selectedMonthDays;

  CalendarScrollerViewModel() {
    _dateTime = DateTime.now();
    _selectedMonth = _dateTime.month;
    _selectedDayIndex = _dateTime.day - 1;
    _setMonthDays(_dateTime);
  }

  List<DateTime> get monthDays => _selectedMonthDays;

  int get selectedDayIndex => _selectedDayIndex;
  set selectedDayIndex(int value) {
    _selectedDayIndex = value;
    _dateTime = DateTime(_dateTime.year, _dateTime.month, value + 1);
    notifyListeners();
  }

  int get selectedMonth => _selectedMonth;
  set selectedMonth(int value) {
    _selectedMonth = value;
    _dateTime = DateTime(_dateTime.year, value, _dateTime.day);
    _setMonthDays(_dateTime);
    notifyListeners();
  }

  void _setMonthDays(DateTime date) {
    var daysCount = daysInMonth(date.year, date.month);
    _selectedMonthDays = List.generate(
      daysCount,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }
}
