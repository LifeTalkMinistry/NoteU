import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../data/local_note.dart';

class MyNotesScreen extends StatelessWidget {
  const MyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<dynamic>(StorageKeys.notesBox);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: ValueListenableBuilder<Box<dynamic>>(
                valueListenable: notesBox.listenable(),
                builder: (context, box, _) {
                  final notes = box.values
                      .whereType<Map<dynamic, dynamic>>()
                      .map(LocalNote.fromMap)
                      .toList()
                    ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: _Header(hasNotes: notes.isNotEmpty)),
                      if (notes.isEmpty)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: _EmptyNotesState(),
                        )
                      else
                        SliverList.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: index == notes.length - 1 ? 0 : 14),
                            child: _NoteCard(note: notes[index]),
                          ),
                        ),
                      const SliverToBoxAdapter(child: SizedBox(height: 34)),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.hasNotes});

  final bool hasNotes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 34),
        Row(
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: IconButton(
                onPressed: () => context.go(AppRoutes.home),
                icon: const Icon(Icons.chevron_left_rounded),
                color: AppColors.primary,
                iconSize: 30,
                padding: EdgeInsets.zero,
              ),
            ),
            Expanded(
              child: Text(
                'My Notes',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            const SizedBox(width: 36),
          ],
        ),
        SizedBox(height: hasNotes ? 38 : 56),
        Text(
          'My Notes',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                height: 1.04,
                letterSpacing: -1.1,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'The knowledge you decided to keep.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14.5,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
        ),
        SizedBox(height: hasNotes ? 28 : 0),
      ],
    );
  }
}

class _EmptyNotesState extends StatelessWidget {
  const _EmptyNotesState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withOpacity(.06),
                blurRadius: 34,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.menu_book_rounded, color: AppColors.primary),
              ),
              const SizedBox(height: 22),
              Text(
                'No notes yet.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                      letterSpacing: -.5,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Start by capturing one lesson worth remembering.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: () => context.push(AppRoutes.newNote),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('New Note'),
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.note});

  final LocalNote note;

  @override
  Widget build(BuildContext context) {
    final preview = note.body.trim().replaceAll('\n', ' ');

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push('${AppRoutes.newNote}?id=${Uri.encodeComponent(note.id)}'),
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withOpacity(.045),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -.4,
                    ),
              ),
              if (preview.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  preview,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                ),
              ],
              const SizedBox(height: 16),
              Text(
                _formatDate(note.updatedAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
