import 'package:flutter/material.dart';
import 'package:reminding_notes/core/notes/services/notes_service.dart';

import 'note_view_model.dart';

class NotesListViewModel extends ChangeNotifier {
  final NotesService notesService;
  late List<NoteViewModel> _notes;

  NotesListViewModel({required this.notesService}) {
    _notes = [];
  }

  List<NoteViewModel> get notes => _notes;
  Future loadNotes(DateTime day) async {
    var result = await notesService.getNotesForDay(day);
    _notes = result
        .map(
          (note) => NoteViewModel.fromDto(noteData: note),
        )
        .toList();
    notifyListeners();
  }
}
