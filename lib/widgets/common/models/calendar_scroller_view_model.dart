import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

class CalendarScrollerViewModel extends ChangeNotifier {
  static final List<int> YEARS =
      List.generate(8, (index) => DateTime.now().toUtc().year + index - 1);
  static final List<String> MONTHS = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  late DateTime _dateTime;
  late int _selectedDayIndex;
  late int _selectedYear;
  late int _selectedMonth;
  late List<DateTime> _selectedMonthDays;

  CalendarScrollerViewModel() {
    _dateTime = DateTime.now();
    _selectedYear = _dateTime.year;
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
    _dateTime = DateTime(_dateTime.year, _dateTime.month, selectedDayIndex + 1);
    notifyListeners();
  }

  int get selectedYear => _selectedYear;
  set selectedYear(int value) {
    _selectedYear = value;
    _setSelectedDay(_selectedYear, _dateTime.month, selectedDayIndex + 1);
    notifyListeners();
  }

  int get selectedMonth => _selectedMonth;
  set selectedMonth(int value) {
    _selectedMonth = value;
    _setSelectedDay(_dateTime.year, value, selectedDayIndex + 1);

    notifyListeners();
  }

  void _setSelectedDay(int year, int month, int day) {
    var daysCount = daysInMonth(_dateTime.year, month);
    selectedDayIndex = min(selectedDayIndex, daysCount - 1);
    _dateTime = DateTime(_dateTime.year, month, selectedDayIndex + 1);

    _setMonthDays(daysCount);
  }

  void _setMonthDays(int daysCount) {
    _selectedMonthDays = List.generate(
      daysCount,
      (index) => DateTime(_dateTime.year, _dateTime.month, index + 1),
    );
  }
}
