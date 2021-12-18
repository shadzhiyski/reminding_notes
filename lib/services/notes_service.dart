import 'package:reminding_notes/models/note_view_model.dart';

// TODO: change view model to DTO
class NotesService {
  const NotesService();
  Future<List<NoteViewModel>> getNotesForDay(DateTime day) async =>
      Future.value([
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 12, 06, 45, 00),
          title: "Example Title",
          description: "Some description",
          type: NoteType.scheduledReminding,
          status: NoteStatus.active,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 12, 8, 30, 00),
          title: "Example Title 2",
          description: "Some description 2",
          type: NoteType.scheduledReminding,
          status: NoteStatus.active,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 11, 09, 45, 00),
          title: "Once Remind Note 3",
          description: "Some description",
          type: NoteType.dailyReminding,
          status: NoteStatus.active,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 11, 11, 45, 00),
          title: "Once Remind Note (DONE)",
          description: "Some description",
          type: NoteType.monthlyReminding,
          status: NoteStatus.done,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 12, 06, 45, 00),
          title: "Example Title",
          description: "Some description",
          type: NoteType.scheduledReminding,
          status: NoteStatus.active,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 12, 8, 30, 00),
          title: "Example Title 2",
          description: "Some description 2",
          type: NoteType.scheduledReminding,
          status: NoteStatus.active,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 11, 09, 45, 00),
          title: "Once Remind Note 3",
          description: "Some description",
          type: NoteType.dailyReminding,
          status: NoteStatus.active,
        ),
        NoteViewModel(
          dateTime: DateTime.utc(2021, 12, 11, 11, 45, 00),
          title: "Once Remind Note (DONE)",
          description: "Some description",
          type: NoteType.monthlyReminding,
          status: NoteStatus.done,
        ),
      ]);
  Future<Map<DateTime, List<NoteViewModel>>> getNotesByDay() async => {
        DateTime.utc(2021, 12, 12, 00, 00, 00): [
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 12, 06, 45, 00),
            title: "Example Title",
            description: "Some description",
            type: NoteType.scheduledReminding,
            status: NoteStatus.active,
          ),
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 12, 8, 30, 00),
            title: "Example Title 2",
            description: "Some description 2",
            type: NoteType.scheduledReminding,
            status: NoteStatus.active,
          ),
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 11, 09, 45, 00),
            title: "Once Remind Note 3",
            description: "Some description",
            type: NoteType.dailyReminding,
            status: NoteStatus.active,
          ),
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 11, 11, 45, 00),
            title: "Once Remind Note (DONE)",
            description: "Some description",
            type: NoteType.monthlyReminding,
            status: NoteStatus.done,
          ),
        ],
        DateTime.utc(2021, 12, 11, 00, 00, 00): [
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 12, 09, 30, 00),
            title: "Example Title 3",
            description: "Some description 3",
            type: NoteType.weeklyReminding,
            status: NoteStatus.active,
          ),
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 11, 13, 30, 00),
            title: "Once Remind Note",
            description: "Some description",
            type: NoteType.scheduledReminding,
            status: NoteStatus.active,
          ),
        ],
        DateTime.utc(2021, 12, 10, 00, 00, 00): [
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 10, 11, 30, 00),
            title: "Once Remind Note 2",
            description: "Some description",
            type: NoteType.scheduledReminding,
            status: NoteStatus.active,
          ),
          NoteViewModel(
            dateTime: DateTime.utc(2021, 12, 10, 11, 30, 00),
            title: "Once Remind Note (DONE)",
            description: "Some description",
            type: NoteType.scheduledReminding,
            status: NoteStatus.done,
          ),
        ]
      };
}
