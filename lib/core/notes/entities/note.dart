import 'package:reminding_notes/core/common/base_entity.dart';

import 'reminding.dart';

class Note extends BaseEntity {
  final String title;
  final String? description;
  final String noteType;

  final Reminding? reminding;

  const Note({
    required int id,
    required this.title,
    this.description,
    required this.noteType,
    this.reminding,
  }) : super(id: id);
}
