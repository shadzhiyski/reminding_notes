import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';

class CalendarScrollerWidget extends StatefulWidget {
  const CalendarScrollerWidget({Key? key}) : super(key: key);

  @override
  State<CalendarScrollerWidget> createState() => _CalendarScrollerWidgetState();
}

class _CalendarScrollerWidgetState extends State<CalendarScrollerWidget> {
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
  int _selectedDayIndex = 0;
  int? _selectedMonth = 0;
  List<DateTime> _selectedMonthDays = [];

  @override
  void initState() {
    super.initState();

    var currentDate = DateTime.now();
    _selectedMonth = currentDate.month;
    _selectedDayIndex = currentDate.day - 1;

    var daysCount = daysInMonth(currentDate.year, currentDate.month);
    _selectedMonthDays = List.generate(
      daysCount,
      (index) => DateTime(currentDate.year, currentDate.month, index + 1),
    );
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            DropdownButton<int>(
              iconSize: 32,
              dropdownColor: Theme.of(context).colorScheme.primary,
              iconEnabledColor:
                  Theme.of(context).primaryTextTheme.headline5!.color,
              value: _selectedMonth,
              items: MONTHS
                  .asMap()
                  .map(
                    (i, monthName) => MapEntry<int, DropdownMenuItem<int>>(
                      i,
                      DropdownMenuItem<int>(
                        child: Text(
                          monthName,
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                        value: i + 1,
                      ),
                    ),
                  )
                  .values
                  .toList(),
              onChanged: (val) => setState(() => _selectedMonth = val),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                height: 90,
                child: PageView.builder(
                  itemCount: _selectedMonthDays.length,
                  controller: PageController(
                      initialPage: _selectedDayIndex, viewportFraction: 0.16),
                  onPageChanged: (int index) =>
                      setState(() => _selectedDayIndex = index),
                  itemBuilder: (_, i) => Transform.scale(
                    scale: _selectedDayIndex == i ? 1 : 0.9,
                    child: Card(
                      color: _selectedDayIndex == i
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.background,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${i + 1}",
                                style: const TextStyle(fontSize: 24),
                              ),
                              Text(
                                  DateFormat.E().format(_selectedMonthDays[i])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
