import 'package:hive/hive.dart';

import 'reminding.dart';

class Note extends HiveObject {
  String title;

  String? description;

  Reminding reminding;

  Note({
    required this.title,
    required this.reminding,
    this.description,
  }) : super();
}
