import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminding_notes/core/notes/services/notes_service.dart';
import 'package:reminding_notes/widgets/common/calendar_scroller_widget.dart';

import 'models/notes_list_view_model.dart';
import 'note_list_item_widget.dart';

class NotesListPage extends StatelessWidget {
  final NotesService notesService;

  const NotesListPage({Key? key, required this.notesService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var initialModel = NotesListViewModel(notesService: notesService);
    return ChangeNotifierProvider<NotesListViewModel>(
      create: (context) => initialModel,
      builder: (context, child) => child!,
      child: Consumer<NotesListViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 160,
            flexibleSpace: const CalendarScrollerWidget(),
          ),
          body: FutureBuilder(
            future: model.loadNotes(model.currentLoadedDay),
            builder: (context, snapshot) => SingleChildScrollView(
              child: Padding(
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
              data: Theme.of(context).primaryIconTheme,
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
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/settings'),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Consumer<NotesListViewModel>(
            builder: (context, model, child) => FloatingActionButton(
              child: const Icon(Icons.edit_rounded),
              onPressed: () async {
                var isCreated = (await Navigator.of(context)
                        .pushNamed('/addItem') as bool?) ??
                    false;
                if (isCreated) {
                  model.loadNotes(model.currentLoadedDay);
                }
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
