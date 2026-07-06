class LearningNote {
  const LearningNote({
    required this.id,
    required this.whatLearned,
    required this.whyItMatters,
    required this.whereToApply,
    required this.createdAt,
    required this.updatedAt,
    this.source,
    this.category,
    this.tags = const [],
    this.difficulty,
    this.personalReflection,
    this.relatedNoteIds = const [],
  });

  final String id;
  final String whatLearned;
  final String whyItMatters;
  final String whereToApply;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? source;
  final String? category;
  final List<String> tags;
  final int? difficulty;
  final String? personalReflection;
  final List<String> relatedNoteIds;
}
