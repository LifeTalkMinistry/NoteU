import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/noteu_app.dart';
import 'core/storage/local_storage_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageInitializer.initialize();
  runApp(const ProviderScope(child: NoteUApp()));
}
