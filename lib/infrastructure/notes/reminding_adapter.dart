import 'package:hive/hive.dart';
import 'package:reminding_notes/core/notes/entities/reminding.dart';

class RemindingAdapter extends TypeAdapter<Reminding> {
  @override
  final typeId = 1;

  @override
  Reminding read(BinaryReader reader) {
    return Reminding(
      dateTime: reader.read(),
      type: reader.read(),
      status: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Reminding obj) {
    writer.write(obj.dateTime);
    writer.write(obj.type);
    writer.write(obj.status);
  }
}
