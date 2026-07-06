import '../../domain/entities/learning_note.dart';

class LearningNoteModel extends LearningNote {
  const LearningNoteModel({
    required super.id,
    required super.whatLearned,
    required super.whyItMatters,
    required super.whereToApply,
    required super.createdAt,
    required super.updatedAt,
    super.source,
    super.category,
    super.tags,
    super.difficulty,
    super.personalReflection,
    super.relatedNoteIds,
  });
}
