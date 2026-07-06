import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/noteu_card.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../../../shared/presentation/widgets/secondary_button.dart';
import '../../../../shared/presentation/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.home,
      children: [
        Text('Welcome back', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.xs),
        Text('What are you learning today?', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: AppSpacing.lg),
        PrimaryButton(label: 'New Note', icon: Icons.edit_rounded, onPressed: () => context.push(AppRoutes.newNote)),
        const SizedBox(height: AppSpacing.sm),
        SecondaryButton(label: 'Continue Review', icon: Icons.refresh_rounded, onPressed: () => context.go(AppRoutes.review)),
        const SizedBox(height: AppSpacing.xl),
        const SectionHeader(title: 'Recent Notes', subtitle: 'Your meaningful notes will appear here as you build your learning trail.'),
        const SizedBox(height: AppSpacing.md),
        NoteUCard(child: Text('Start with one lesson you understood today.', style: Theme.of(context).textTheme.bodyLarge)),
        const SizedBox(height: AppSpacing.xl),
        const SectionHeader(title: 'Learning Identity Preview', subtitle: 'Small signals of growth will become clearer as you review.'),
        const SizedBox(height: AppSpacing.md),
        NoteUCard(
          backgroundColor: AppColors.accentSoft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Developing Systems Thinker', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: AppSpacing.xs),
              Text('This is a reflection signal, not a scorecard.', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
