import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminding_notes/widgets/notes/models/notes_list_view_model.dart';

import 'models/calendar_scroller_view_model.dart';

class CalendarScrollerWidget extends StatelessWidget {
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

  const CalendarScrollerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notesListModel =
        Provider.of<NotesListViewModel>(context, listen: false);
    return ChangeNotifierProvider<CalendarScrollerViewModel>(
      create: (context) => CalendarScrollerViewModel(),
      builder: (context, child) => child!,
      child: Consumer<CalendarScrollerViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Column(
            children: [
              DropdownButton<int>(
                iconSize: 32,
                dropdownColor: Theme.of(context).colorScheme.primary,
                iconEnabledColor:
                    Theme.of(context).primaryTextTheme.headline5!.color,
                value: model.selectedMonth,
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
                onChanged: (val) {
                  model.selectedMonth = val ?? 0;
                  notesListModel.loadNotes(model.selectedDay);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SizedBox(
                  height: 90,
                  child: PageView.builder(
                    itemCount: model.monthDays.length,
                    controller: PageController(
                      initialPage: model.selectedDayIndex,
                      viewportFraction: 0.16,
                    ),
                    onPageChanged: (int index) {
                      model.selectedDayIndex = index;
                      notesListModel.loadNotes(model.selectedDay);
                    },
                    itemBuilder: (_, index) => Transform.scale(
                      scale: model.selectedDayIndex == index ? 1 : 0.9,
                      child: GestureDetector(
                        onTap: () {
                          model.selectedDayIndex = index;
                          notesListModel.loadNotes(model.selectedDay);
                        },
                        child: Card(
                          color: model.selectedDayIndex == index
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
                                    "${index + 1}",
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    DateFormat.E()
                                        .format(model.monthDays[index]),
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
