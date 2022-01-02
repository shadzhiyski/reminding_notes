import 'package:reminding_notes/core/notes/dto/note_data.dart';

class NotesService {
  final Map<DateTime, List<NoteData>> notesByDay = {
    DateTime.utc(2021, 12, 20, 00, 00, 00): [
      NoteData(
        id: 1,
        dateTime: DateTime.utc(2021, 12, 20, 06, 45, 00),
        title: "Example Title",
        description: "Some description",
        type: NoteType.scheduled,
        status: NoteStatus.active,
      ),
      NoteData(
        id: 2,
        dateTime: DateTime.utc(2021, 12, 20, 8, 30, 00),
        title: "Example Title 2",
        description: "Some description 2",
        type: NoteType.scheduled,
        status: NoteStatus.active,
      ),
      NoteData(
        id: 3,
        dateTime: DateTime.utc(2021, 12, 20, 09, 45, 00),
        title: "Once Remind Note 3",
        description: "Some description",
        type: NoteType.daily,
        status: NoteStatus.active,
      ),
      NoteData(
        id: 4,
        dateTime: DateTime.utc(2021, 12, 20, 11, 45, 00),
        title: "Once Remind Note (DONE)",
        description: "Some description",
        type: NoteType.monthly,
        status: NoteStatus.done,
      ),
    ],
    DateTime.utc(2021, 12, 19, 00, 00, 00): [
      NoteData(
        id: 5,
        dateTime: DateTime.utc(2021, 12, 19, 09, 30, 00),
        title: "Example Title 3",
        description: "Some description 3",
        type: NoteType.weekly,
        status: NoteStatus.active,
      ),
      NoteData(
        id: 6,
        dateTime: DateTime.utc(2021, 12, 19, 13, 30, 00),
        title: "Once Remind Note",
        description: "Some description",
        type: NoteType.scheduled,
        status: NoteStatus.active,
      ),
    ],
    DateTime.utc(2021, 12, 18, 00, 00, 00): [
      NoteData(
        id: 7,
        dateTime: DateTime.utc(2021, 12, 18, 11, 30, 00),
        title: "Once Remind Note 2",
        description: "Some description",
        type: NoteType.scheduled,
        status: NoteStatus.active,
      ),
      NoteData(
        id: 8,
        dateTime: DateTime.utc(2021, 12, 18, 11, 30, 00),
        title: "Once Remind Note (DONE)",
        description: "Some description",
        type: NoteType.scheduled,
        status: NoteStatus.done,
      ),
    ]
  };

  NotesService();

  Future<List<NoteData>> getNotesForDay(DateTime day) {
    var filterDay = DateTime.utc(day.year, day.month, day.day);

    return Future.value(notesByDay[filterDay] ?? []);
  }
}
