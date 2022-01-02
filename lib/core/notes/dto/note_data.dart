enum NoteType { scheduled, daily, weekly, monthly, annual }

enum NoteStatus {
  active,
  dismissed,
  delayed,
  done,
  cancelled,
}

class NoteData {
  final int id;
  final DateTime? dateTime;
  final String? title;
  final String? description;
  final NoteType? type;
  final NoteStatus? status;

  NoteData({
    required this.id,
    this.dateTime,
    this.title,
    this.description,
    this.type,
    this.status,
  });
}
