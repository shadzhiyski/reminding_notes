import 'package:flutter/material.dart';
import 'package:reminding_notes/core/notes/models/note_view_model.dart';

import 'package:intl/intl.dart';

import 'note_list_item_widget.dart';

class NotesGroupWidget extends StatelessWidget {
  final DateTime day;
  final List<NoteViewModel> notes;

  const NotesGroupWidget({
    Key? key,
    required this.day,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          DateFormat.yMMMd().format(day),
          style: Theme.of(context).textTheme.headline5,
        ),
        children: notes
            .map(
              (note) => NoteListItemWidget(
                model: note,
              ),
            )
            .toList(),
      );
}
