class LearningIdentity {
  const LearningIdentity({
    required this.id,
    required this.identityScore,
    required this.primaryDomain,
    required this.updatedAt,
    this.learningDomains = const [],
    this.identitySignals = const [],
  });

  final String id;
  final double identityScore;
  final String primaryDomain;
  final DateTime updatedAt;
  final List<String> learningDomains;
  final List<String> identitySignals;
}
