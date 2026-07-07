import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/identity/presentation/screens/learning_identity_screen.dart';
import '../../features/notes/presentation/screens/my_notes_screen.dart';
import '../../features/notes/presentation/screens/new_note_screen.dart';
import '../../features/review/presentation/screens/review_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/splash/presentation/screens/launch_screen.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const LaunchScreen()),
      GoRoute(path: AppRoutes.home, builder: (context, state) => const HomeScreen()),
      GoRoute(path: AppRoutes.newNote, builder: (context, state) => const NewNoteScreen()),
      GoRoute(path: AppRoutes.myNotes, builder: (context, state) => const MyNotesScreen()),
      GoRoute(path: AppRoutes.review, builder: (context, state) => const ReviewScreen()),
      GoRoute(path: AppRoutes.identity, builder: (context, state) => const LearningIdentityScreen()),
      GoRoute(path: AppRoutes.settings, builder: (context, state) => const SettingsScreen()),
    ],
  );
});
