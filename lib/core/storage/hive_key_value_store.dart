import 'package:hive/hive.dart';

import 'local_key_value_store.dart';

class HiveKeyValueStore implements LocalKeyValueStore {
  const HiveKeyValueStore();

  @override
  Future<void> save({
    required String collection,
    required String key,
    required Map<String, dynamic> value,
  }) async {
    final box = Hive.box<dynamic>(collection);
    await box.put(key, value);
  }

  @override
  Future<Map<String, dynamic>?> read({
    required String collection,
    required String key,
  }) async {
    final box = Hive.box<dynamic>(collection);
    final value = box.get(key);
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return null;
  }

  @override
  Future<List<Map<String, dynamic>>> readAll({required String collection}) async {
    final box = Hive.box<dynamic>(collection);
    return box.values
        .whereType<Map>()
        .map((value) => Map<String, dynamic>.from(value))
        .toList(growable: false);
  }

  @override
  Future<void> remove({
    required String collection,
    required String key,
  }) async {
    final box = Hive.box<dynamic>(collection);
    await box.delete(key);
  }
}
