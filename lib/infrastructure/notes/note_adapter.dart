import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminding_notes/core/notes/entities/note.dart';
import 'package:reminding_notes/core/notes/entities/reminding.dart';

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final typeId = 0;

  @override
  Note read(BinaryReader reader) {
    return Note(
      title: reader.read(),
      description: reader.read(),
      remindings: reader.readList().cast<Reminding>(),
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.write(obj.title);
    writer.write(obj.description);
    writer.writeList(obj.remindings);
  }
}
