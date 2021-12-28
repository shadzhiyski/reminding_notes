import 'package:hive/hive.dart';

import 'reminding.dart';

class Note extends HiveObject {
  String title;

  String? description;

  List<Reminding> remindings;

  Note({
    required this.title,
    required this.remindings,
    this.description,
  }) : super();
}
