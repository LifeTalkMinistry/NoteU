import 'package:hive_flutter/hive_flutter.dart';

import 'storage_keys.dart';

abstract final class LocalStorageInitializer {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(StorageKeys.notesBox);
    await Hive.openBox<dynamic>(StorageKeys.reviewHistoryBox);
    await Hive.openBox<dynamic>(StorageKeys.identitySnapshotBox);
  }
}
