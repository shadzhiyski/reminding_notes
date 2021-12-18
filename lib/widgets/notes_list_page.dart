import 'package:flutter/material.dart';
import 'package:reminding_notes/models/note_view_model.dart';
import 'package:reminding_notes/services/notes_service.dart';

import 'calendar_scroller_widget.dart';
import 'note_list_item_widget.dart';

class NotesListPage extends StatefulWidget {
  final NotesService notesService;

  const NotesListPage({Key? key, required this.notesService}) : super(key: key);

  @override
  _NotesListPageState createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  List<NoteViewModel> _notesByDay = [];

  @override
  void initState() {
    super.initState();
    widget.notesService
        .getNotesForDay(DateTime.now())
        .then((value) => setState(() => _notesByDay = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        flexibleSpace: const CalendarScrollerWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: _notesByDay
                    .map(
                      (note) => NoteListItemWidget(
                        model: note,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
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
