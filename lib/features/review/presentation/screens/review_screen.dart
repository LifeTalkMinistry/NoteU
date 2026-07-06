import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/noteu_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.review,
      showNavigation: false,
      children: [
        const SizedBox(height: AppSpacing.lg),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Continue Review', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'How do you want to review?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xl),
              const _ReviewMethodCard(
                title: 'Quick Quiz',
                icon: Icons.quiz_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              const _ReviewMethodCard(
                title: 'Flashcards',
                icon: Icons.style_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              const _ReviewMethodCard(
                title: 'Recall Test',
                icon: Icons.psychology_alt_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              const _ReviewMethodCard(
                title: 'Apply It',
                icon: Icons.lightbulb_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReviewMethodCard extends StatelessWidget {
  const _ReviewMethodCard({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return NoteUCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          const Icon(Icons.arrow_forward_rounded, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
