import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/learning_input.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Note')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Capture one real learning.',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const LearningInput(
                    title: 'What did I learn?',
                    placeholder: 'Write the lesson in your own words.',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const LearningInput(
                    title: 'Why does this matter?',
                    placeholder: 'Explain why this lesson has value.',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const LearningInput(
                    title: 'Where can I apply this?',
                    placeholder: 'Name a real situation where this becomes useful.',
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryButton(label: 'Save', icon: Icons.check_rounded, onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
