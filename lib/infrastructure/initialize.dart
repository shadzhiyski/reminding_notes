import 'package:hive_flutter/hive_flutter.dart';

import 'notes/note_adapter.dart';
import 'notes/reminding_adapter.dart';

Future initializeInfrastructure() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(RemindingAdapter());
}
