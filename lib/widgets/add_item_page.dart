import 'package:flutter/material.dart';
import 'package:reminding_notes/models/note_view_model.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({Key? key}) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    // TODO: set date
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    // TODO: set time
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  helperText: 'Event title',
                  suffixIcon: const Icon(
                    Icons.check_circle_rounded,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                maxLength: 200,
                minLines: 8,
                maxLines: 21,
                decoration: InputDecoration(
                  labelText: 'Note',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  helperText: 'Event note',
                  suffixIcon: const Icon(
                    Icons.check_circle_rounded,
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Row(
                      children: const [
                        Icon(Icons.access_time_rounded),
                        Text('Time'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Row(
                      children: const [
                        Icon(Icons.event_rounded),
                        Text('Date'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: DropdownButton<int>(
                      value: 1,
                      items: NoteType.values
                          .asMap()
                          .map(
                            (i, monthName) =>
                                MapEntry<int, DropdownMenuItem<int>>(
                              i,
                              DropdownMenuItem<int>(
                                child: Text(
                                  monthName.name.replaceFirst('Reminding', ''),
                                ),
                                value: i + 1,
                              ),
                            ),
                          )
                          .values
                          .toList(),
                      onChanged: (val) {
                        // TODO: set note type action
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
