import 'package:flutter/material.dart';
import 'package:reminding_notes/core/notes/services/notes_service.dart';

import 'note_view_model.dart';

class NotesListViewModel extends ChangeNotifier {
  final NotesService notesService;
  late DateTime _currentLoadedDay;
  late List<NoteViewModel> _notes;

  NotesListViewModel({required this.notesService}) {
    _notes = [];
    _currentLoadedDay = DateTime.now();
  }

  DateTime get currentLoadedDay => _currentLoadedDay;
  List<NoteViewModel> get notes => _notes;
  Future loadNotes(DateTime day) async {
    _currentLoadedDay = day;
    var result = await notesService.getNotesForDay(day);
    _notes = result
        .map(
          (note) => NoteViewModel.fromDto(noteData: note),
        )
        .toList();
    notifyListeners();
  }
}
