import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../../../shared/presentation/widgets/secondary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.home,
      showNavigation: false,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'What are you learning today?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                label: 'New Note',
                icon: Icons.edit_rounded,
                onPressed: () => context.push(AppRoutes.newNote),
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                label: 'Continue Review',
                icon: Icons.refresh_rounded,
                onPressed: () => context.push(AppRoutes.review),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
