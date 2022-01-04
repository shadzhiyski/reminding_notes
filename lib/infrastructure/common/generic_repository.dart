import 'package:hive_flutter/hive_flutter.dart';

class GenericRepository<T> {
  bool _isInitialized = false;
  final String boxNameAlias;
  late String boxName = boxNameAlias.isEmpty
      ? '${T.toString()}-items'
      : '${T.toString()}-$boxNameAlias-items';
  late Box<T> itemsBox;

  GenericRepository({this.boxNameAlias = ''});

  bool get isInitialized => _isInitialized;

  Future init() async {
    itemsBox = await Hive.openBox<T>(boxName);
    _isInitialized = true;
  }

  Future add(T entry) => itemsBox.add(entry);

  T? get(int id) => itemsBox.get(id);

  List<T> getWhere(bool Function(T element) filter) =>
      itemsBox.values.where(filter).toList();

  List<T> getAll() => itemsBox.values.toList();

  Future delete(int id) => itemsBox.delete(id);
}
