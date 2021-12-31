import 'dart:math';

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
    var daysCount = daysInMonth(_dateTime.year, _selectedMonth);
    _setMonthDays(daysCount);
  }

  DateTime get selectedDay => _selectedMonthDays[_selectedDayIndex];
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
    var daysCount = daysInMonth(_dateTime.year, value);
    selectedDayIndex = min(selectedDayIndex, daysCount - 1);
    _dateTime = DateTime(_dateTime.year, value, selectedDayIndex + 1);

    _setMonthDays(daysCount);
    notifyListeners();
  }

  void _setMonthDays(int daysCount) {
    _selectedMonthDays = List.generate(
      daysCount,
      (index) => DateTime(_dateTime.year, _dateTime.month, index + 1),
    );
  }
}
