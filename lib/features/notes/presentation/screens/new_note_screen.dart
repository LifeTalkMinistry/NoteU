import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../../shared/presentation/widgets/learning_input.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../data/local_note.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final _titleController = TextEditingController();
  final _lessonController = TextEditingController();
  final _matterController = TextEditingController();
  final _applyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _lessonController.dispose();
    _matterController.dispose();
    _applyController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    final title = _titleController.text.trim();
    final lesson = _lessonController.text.trim();
    final matter = _matterController.text.trim();
    final apply = _applyController.text.trim();

    if (title.isEmpty && lesson.isEmpty && matter.isEmpty && apply.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Write one lesson before saving.')),
      );
      return;
    }

    final bodyParts = <String>[
      if (lesson.isNotEmpty) 'What I learned:\n$lesson',
      if (matter.isNotEmpty) 'Why this matters:\n$matter',
      if (apply.isNotEmpty) 'Where I can apply this:\n$apply',
    ];

    final now = DateTime.now();
    final note = LocalNote(
      id: const Uuid().v4(),
      title: title.isNotEmpty ? title : 'Untitled Note',
      body: bodyParts.join('\n\n'),
      createdAt: now,
      updatedAt: now,
    );

    final notesBox = Hive.box<dynamic>(StorageKeys.notesBox);
    await notesBox.put(note.id, note.toMap());

    if (!mounted) return;
    context.go(AppRoutes.myNotes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Note')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Capture one real learning.',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  TextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Title'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  LearningInput(
                    title: 'What did I learn?',
                    placeholder: 'Write the lesson in your own words.',
                    controller: _lessonController,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  LearningInput(
                    title: 'Why does this matter?',
                    placeholder: 'Explain why this lesson has value.',
                    controller: _matterController,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  LearningInput(
                    title: 'Where can I apply this?',
                    placeholder: 'Name a real situation where this becomes useful.',
                    controller: _applyController,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryButton(label: 'Save', icon: Icons.check_rounded, onPressed: _saveNote),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
