import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/noteu_card.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../../../shared/presentation/widgets/secondary_button.dart';
import '../../../../shared/presentation/widgets/section_header.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.review,
      children: [
        const SectionHeader(
          title: 'Today\'s Review',
          subtitle: 'One idea at a time. Review should feel rewarding, not heavy.',
        ),
        const SizedBox(height: AppSpacing.lg),
        NoteUCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text('Learning Card'),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Delayed gratification helps you choose a better future reward over instant comfort.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Ask yourself where this idea showed up recently in your real life.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        PrimaryButton(label: 'Remembered', icon: Icons.check_rounded, onPressed: () {}),
        const SizedBox(height: AppSpacing.sm),
        SecondaryButton(label: 'Needs Review', icon: Icons.refresh_rounded, onPressed: () {}),
      ],
    );
  }
}
