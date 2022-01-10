import 'package:flutter/material.dart';
import 'package:reminding_notes/core/notes/dto/note_data.dart';

class NoteViewModel extends ChangeNotifier {
  late int _id;
  DateTime? _dateTime;
  String? _title;
  String? _description;
  NoteType? _type;
  NoteStatus? _status;

  NoteViewModel({
    required int id,
    required DateTime? dateTime,
    required String? title,
    required String? description,
    required NoteType? type,
    required NoteStatus? status,
  }) {
    _id = id;
    _dateTime = dateTime;
    _title = title;
    _description = description;
    _type = type;
    _status = status;
  }

  NoteViewModel.fromDto({required NoteData noteData}) {
    _id = noteData.id;
    _dateTime = noteData.dateTime;
    _title = noteData.title;
    _description = noteData.description;
    _type = noteData.type;
    _status = noteData.status;
  }

  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? value) {
    _dateTime = value;
    notifyListeners();
  }

  int get id => _id;

  String? get title => _title;
  set title(String? value) {
    _title = value;
    notifyListeners();
  }

  String? get description => _description;
  set description(String? value) {
    _description = value;
    notifyListeners();
  }

  NoteType? get type => _type;
  set type(NoteType? value) {
    _type = value;
    notifyListeners();
  }

  NoteStatus? get status => _status;
  set status(NoteStatus? value) {
    _status = value;
    notifyListeners();
  }

  NoteData toDto() => NoteData(
        id: id,
        dateTime: dateTime,
        title: title,
        description: description,
        type: type,
        status: status,
      );
}
