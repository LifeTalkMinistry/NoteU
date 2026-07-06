import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/noteu_card.dart';
import '../../../../shared/presentation/widgets/section_header.dart';

class LearningIdentityScreen extends StatelessWidget {
  const LearningIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.identity,
      children: [
        const SectionHeader(
          title: 'Your Learning Identity',
          subtitle: 'Patterns will appear as you keep learning, writing, and reviewing.',
        ),
        const SizedBox(height: AppSpacing.lg),
        NoteUCard(
          backgroundColor: AppColors.accentSoft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You are becoming', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.sm),
              Text('A Systems Thinker', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSpacing.sm),
              Text('This is an early reflection signal, not a final score.', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const _SignalRow(label: 'Current streak', value: 'Ready to begin'),
        const _SignalRow(label: 'Knowledge reviewed', value: 'No reviews yet'),
        const _SignalRow(label: 'Growth over time', value: 'Build your first pattern'),
        const _SignalRow(label: 'Recent themes', value: 'Waiting for meaningful notes'),
      ],
    );
  }
}

class _SignalRow extends StatelessWidget {
  const _SignalRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: NoteUCard(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyLarge),
            Flexible(
              child: Text(value, textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
