import 'package:hive/hive.dart';

class Reminding extends HiveObject {
  DateTime dateTime;

  String type;

  String status;

  Reminding({
    required this.dateTime,
    required this.type,
    required this.status,
  }) : super();
}
