import 'package:hive_flutter/hive_flutter.dart';

class GenericRepository<T> {
  bool _isInitialized = false;
  final String boxName = '${T.toString()}-items';
  late Box<T> itemsBox;

  bool get isInitialized => _isInitialized;

  Future init() async {
    itemsBox = await Hive.openBox<T>(boxName);
    _isInitialized = true;
  }

  Future add(T entry) => itemsBox.add(entry);

  T? get(int id) => itemsBox.get(id);

  List<T> getAll() => itemsBox.values.toList();

  Future delete(int id) => itemsBox.delete(id);
}
