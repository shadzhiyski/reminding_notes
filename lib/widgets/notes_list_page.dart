import 'package:flutter/material.dart';
import 'package:reminding_notes/models/note_view_model.dart';
import 'package:reminding_notes/services/notes_service.dart';

import 'notes_group_widget.dart';

class NotesListPage extends StatefulWidget {
  final NotesService notesService;

  const NotesListPage({Key? key, required this.notesService}) : super(key: key);

  @override
  _NotesListPageState createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  Map<DateTime, List<NoteViewModel>> _notesByDay =
      <DateTime, List<NoteViewModel>>{};

  @override
  void initState() {
    super.initState();
    widget.notesService
        .getNotesByDay()
        .then((value) => setState(() => _notesByDay = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _notesByDay.keys
            .map(
              (day) => NotesGroupWidget(
                day: day,
                notes: _notesByDay[day]!,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.filter_list_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings_rounded),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit_rounded),
        onPressed: () => Navigator.of(context).pushNamed('/addItem'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
