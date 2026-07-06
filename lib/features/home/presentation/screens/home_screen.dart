import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.22),
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'What are you\nlearning today?',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          height: 1.04,
                          letterSpacing: -1.1,
                          color: AppColors.textPrimary,
                        ),
                  ),
                  const SizedBox(height: 30),
                  _HomeActionButton(
                    label: 'New Note',
                    filled: true,
                    onPressed: () => context.push(AppRoutes.newNote),
                  ),
                  const SizedBox(height: 12),
                  _HomeActionButton(
                    label: 'Continue Review',
                    filled: false,
                    onPressed: () => context.push(AppRoutes.review),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeActionButton extends StatelessWidget {
  const _HomeActionButton({
    required this.label,
    required this.filled,
    required this.onPressed,
  });

  final String label;
  final bool filled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = filled ? AppColors.primary : AppColors.surface;
    final foregroundColor = filled ? Colors.white : AppColors.textPrimary;
    final borderColor = filled ? AppColors.primary : AppColors.border;
    final arrowColor = filled ? Colors.white : AppColors.primary;

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor, width: 1.2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                const SizedBox(width: 26),
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: foregroundColor,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_rounded, size: 22, color: arrowColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
