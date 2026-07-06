import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NoteU',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'The notes that reveal you.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xl),
              const _IdentityPromptCard(),
              const SizedBox(height: AppSpacing.lg),
              const _MvpLoopCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _IdentityPromptCard extends StatelessWidget {
  const _IdentityPromptCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What kind of learner am I becoming?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'NoteU will help you learn, write, review, and measure growth.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _MvpLoopCard extends StatelessWidget {
  const _MvpLoopCard();

  @override
  Widget build(BuildContext context) {
    const steps = ['Learn', 'Write Notes', 'Review Knowledge', 'See Growth'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('MVP Learning Loop', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            for (final step in steps) ...[
              Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: AppColors.primary),
                  const SizedBox(width: AppSpacing.sm),
                  Text(step, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}
