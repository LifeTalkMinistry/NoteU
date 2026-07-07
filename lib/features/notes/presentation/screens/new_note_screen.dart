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
  const NewNoteScreen({super.key, this.noteId});

  final String? noteId;

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final _titleController = TextEditingController();
  final _lessonController = TextEditingController();
  final _matterController = TextEditingController();
  final _applyController = TextEditingController();

  LocalNote? _editingNote;

  bool get _isEditing => widget.noteId != null && widget.noteId!.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loadExistingNote();
  }

  void _loadExistingNote() {
    if (!_isEditing) return;

    final notesBox = Hive.box<dynamic>(StorageKeys.notesBox);
    final rawNote = notesBox.get(widget.noteId);
    if (rawNote is! Map<dynamic, dynamic>) return;

    final note = LocalNote.fromMap(rawNote);
    _editingNote = note;
    _titleController.text = note.title;
    _fillBodyFields(note.body);
  }

  void _fillBodyFields(String body) {
    final learnedMarker = 'What I learned:\n';
    final mattersMarker = '\n\nWhy this matters:\n';
    final applyMarker = '\n\nWhere I can apply this:\n';

    if (!body.contains(learnedMarker) && !body.contains(mattersMarker) && !body.contains(applyMarker)) {
      _lessonController.text = body;
      return;
    }

    final learnedStart = body.indexOf(learnedMarker);
    final mattersStart = body.indexOf(mattersMarker);
    final applyStart = body.indexOf(applyMarker);

    if (learnedStart != -1) {
      final start = learnedStart + learnedMarker.length;
      final end = mattersStart != -1
          ? mattersStart
          : applyStart != -1
              ? applyStart
              : body.length;
      _lessonController.text = body.substring(start, end).trim();
    }

    if (mattersStart != -1) {
      final start = mattersStart + mattersMarker.length;
      final end = applyStart != -1 ? applyStart : body.length;
      _matterController.text = body.substring(start, end).trim();
    }

    if (applyStart != -1) {
      final start = applyStart + applyMarker.length;
      _applyController.text = body.substring(start).trim();
    }
  }

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
      id: _editingNote?.id ?? const Uuid().v4(),
      title: title.isNotEmpty ? title : 'Untitled Note',
      body: bodyParts.join('\n\n'),
      createdAt: _editingNote?.createdAt ?? now,
      updatedAt: now,
    );

    final notesBox = Hive.box<dynamic>(StorageKeys.notesBox);
    await notesBox.put(note.id, note.toMap());

    if (!mounted) return;
    context.go(AppRoutes.myNotes);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = _editingNote != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Note' : 'New Note')),
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
                    isEditing ? 'Refine this learning.' : 'Capture one real learning.',
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
