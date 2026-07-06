import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/hive_key_value_store.dart';
import '../storage/local_key_value_store.dart';

final localKeyValueStoreProvider = Provider<LocalKeyValueStore>((ref) {
  return const HiveKeyValueStore();
});
