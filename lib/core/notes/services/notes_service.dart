import 'package:reminding_notes/core/notes/dto/note_data.dart';
import 'package:reminding_notes/core/notes/entities/note.dart';
import 'package:reminding_notes/infrastructure/common/generic_repository.dart';

class NotesService {
  final GenericRepository<Note> scheduledNotesRepo;
  final GenericRepository<Note> dailyNotesRepo;
  final GenericRepository<Note> weeklyNotesRepo;
  final GenericRepository<Note> annualNotesRepo;

  NotesService({
    required this.scheduledNotesRepo,
    required this.dailyNotesRepo,
    required this.weeklyNotesRepo,
    required this.annualNotesRepo,
  });

  Future add(NoteData entry) {
    var entity = entry.toEntity();
    if (entry.type == NoteType.scheduled) {
      scheduledNotesRepo.add(entity);
    } else if (entry.type == NoteType.daily) {
      dailyNotesRepo.add(entity);
    } else if (entry.type == NoteType.weekly) {
      weeklyNotesRepo.add(entity);
    } else if (entry.type == NoteType.annual) {
      annualNotesRepo.add(entity);
    }

    return Future.value();
  }

  Future<List<NoteData>> getNotesForDay(DateTime day) {
    var filterDayStart = DateTime.utc(day.year, day.month, day.day);
    var filterDayEnd = filterDayStart.add(const Duration(days: 1));

    var scheduledNotes = scheduledNotesRepo.getWhere(
        (note) => _filterPeriodPredicate(note, filterDayStart, filterDayEnd));
    var dailyNotes = dailyNotesRepo.getWhere(
        (note) => _filterPeriodPredicate(note, filterDayStart, filterDayEnd));
    var weeklyNotes = weeklyNotesRepo.getWhere(
        (note) => _filterPeriodPredicate(note, filterDayStart, filterDayEnd));
    var annualNotes = annualNotesRepo.getWhere(
        (note) => _filterPeriodPredicate(note, filterDayStart, filterDayEnd));

    var notesByDay = (scheduledNotes + dailyNotes + weeklyNotes + annualNotes)
        .map((note) => NoteData.fromEntity(note: note))
        .toList();
    return Future.value(notesByDay);
  }

  bool _filterPeriodPredicate(
          Note note, DateTime filterDayStart, DateTime filterDayEnd) =>
      note.reminding.dateTime.isAfter(filterDayStart) &&
      note.reminding.dateTime.isBefore(filterDayEnd);
}
