import 'package:hive_flutter/hive_flutter.dart';

class GenericRepository<T> {
  late Box<T> itemsBox;

  Future init() async {
    itemsBox = await Hive.openBox<T>('${T.toString()}-items');
  }

  Future add(T entry) => itemsBox.add(entry);

  T? get(int id) => itemsBox.get(id);

  List<T> getAll() => itemsBox.values.toList();

  Future delete(int id) => itemsBox.delete(id);
}
