abstract interface class LocalKeyValueStore {
  Future<void> save({
    required String collection,
    required String key,
    required Map<String, dynamic> value,
  });

  Future<Map<String, dynamic>?> read({
    required String collection,
    required String key,
  });

  Future<List<Map<String, dynamic>>> readAll({required String collection});

  Future<void> remove({
    required String collection,
    required String key,
  });
}
