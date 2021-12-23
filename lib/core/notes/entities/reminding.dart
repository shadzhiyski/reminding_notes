import 'package:reminding_notes/core/common/base_entity.dart';

class Reminding extends BaseEntity {
  final DateTime dateTime;
  final String status;

  const Reminding({
    required int id,
    required this.dateTime,
    required this.status,
  }) : super(id: id);
}
