import 'package:reminding_notes/core/notes/entities/note.dart';
import 'package:reminding_notes/core/notes/entities/reminding.dart';

enum NoteType { scheduled, daily, weekly, monthly, annual }

enum NoteStatus {
  active,
  dismissed,
  delayed,
  done,
  cancelled,
}

class NoteData {
  late int id;
  late DateTime? dateTime;
  late String? title;
  late String? description;
  late NoteType? type;
  late NoteStatus? status;

  NoteData({
    required this.id,
    this.dateTime,
    this.title,
    this.description,
    this.type,
    this.status,
  });

  NoteData.fromEntity({required Note note}) {
    id = note.key;
    dateTime = note.reminding.dateTime;
    title = note.title;
    description = note.description;
    type = NoteType.values.byName(note.reminding.type);
    status = NoteStatus.values.byName(note.reminding.status);
  }

  Note toEntity() => Note(
        title: title!,
        description: description,
        reminding: Reminding(
          dateTime: dateTime!,
          type: type.toString().split('.').last,
          status: status.toString().split('.').last,
        ),
      );
}
