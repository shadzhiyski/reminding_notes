import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminding_notes/models/notes_list_view_model.dart';
import 'package:reminding_notes/services/notes_service.dart';

import 'calendar_scroller_widget.dart';
import 'note_list_item_widget.dart';

class NotesListPage extends StatelessWidget {
  final NotesService notesService;

  const NotesListPage({Key? key, required this.notesService}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<NotesListViewModel>(
        create: (context) => NotesListViewModel(
          notesService: notesService,
        )..loadNotes(DateTime.now()),
        builder: (context, child) => child!,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 160,
            flexibleSpace: const CalendarScrollerWidget(),
          ),
          body: SingleChildScrollView(
            child: Consumer<NotesListViewModel>(
              builder: (context, model, child) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: model.notes
                      .map(
                        (note) => NoteListItemWidget(
                          model: note,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Theme.of(context).primaryColor,
            child: IconTheme(
              data:
                  IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
}
