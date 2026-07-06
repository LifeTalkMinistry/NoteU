class ReviewSession {
  const ReviewSession({
    required this.id,
    required this.noteId,
    required this.reviewedAt,
    required this.wasRemembered,
  });

  final String id;
  final String noteId;
  final DateTime reviewedAt;
  final bool wasRemembered;
}
