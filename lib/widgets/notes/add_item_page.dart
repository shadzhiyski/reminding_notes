import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminding_notes/core/notes/dto/note_data.dart';

import 'models/note_view_model.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({Key? key}) : super(key: key);

  Future<void> _selectDate(NoteViewModel model, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: model.dateTime!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked == null) return;

    model.dateTime = DateTime(
      picked.year,
      picked.month,
      picked.day,
      model.dateTime!.hour,
      model.dateTime!.minute,
    );
  }

  Future<void> _selectTime(NoteViewModel model, BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(model.dateTime!),
    );

    if (picked == null) return;

    model.dateTime = DateTime(
      model.dateTime!.year,
      model.dateTime!.month,
      model.dateTime!.day,
      picked.hour,
      picked.minute,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  // TODO: add save action
                },
                child: const Icon(Icons.done_rounded, size: 26.0),
              ),
            ),
          ],
        ),
        body: ChangeNotifierProvider<NoteViewModel>(
          create: (context) => NoteViewModel(
            id: -1,
            dateTime: DateTime.now().add(const Duration(hours: 1)),
            title: '',
            description: '',
            type: NoteType.scheduled,
            status: NoteStatus.active,
          ),
          child: Consumer<NoteViewModel>(
            builder: (context, model, child) => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      onChanged: (value) => model.title = value,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        helperText: 'Event title',
                        suffixIcon: const Icon(Icons.check_circle_rounded),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      onChanged: (value) => model.description = value,
                      maxLength: 200,
                      minLines: 8,
                      maxLines: 21,
                      decoration: InputDecoration(
                        labelText: 'Note',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        helperText: 'Event note',
                        suffixIcon: const Icon(Icons.check_circle_rounded),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${DateFormat.yMMMMd().format(model.dateTime!)} ${DateFormat.Hm().format(model.dateTime!)}',
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectTime(model, context),
                          child: Row(
                            children: const [
                              Icon(Icons.access_time_rounded),
                              Text('Time'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _selectDate(model, context),
                          child: Row(
                            children: const [
                              Icon(Icons.event_rounded),
                              Text('Date'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DropdownButton<int>(
                    value: model.type!.index + 1,
                    items: NoteType.values
                        .asMap()
                        .map(
                          (i, monthName) =>
                              MapEntry<int, DropdownMenuItem<int>>(
                            i,
                            DropdownMenuItem<int>(
                              child: Text(
                                monthName.name,
                              ),
                              value: i + 1,
                            ),
                          ),
                        )
                        .values
                        .toList(),
                    onChanged: (val) {
                      model.type = NoteType.values[val! - 1];
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
