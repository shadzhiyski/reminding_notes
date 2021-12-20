import 'package:flutter/material.dart';

enum NoteType {
  scheduledReminding,
  dailyReminding,
  weeklyReminding,
  monthlyReminding,
  annualReminding,
  customReminding
}

enum NoteStatus {
  active,
  dismissed,
  delayed,
  done,
  cancelled,
}

// TODO: change dateTime to createDateTime; add editDateTime ???; add scheduleDateTime;
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
}
