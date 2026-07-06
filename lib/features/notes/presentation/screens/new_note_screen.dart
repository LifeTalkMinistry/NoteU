import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/learning_input.dart';
import '../../../../shared/presentation/widgets/noteu_card.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../../../shared/presentation/widgets/secondary_button.dart';
import '../../../../shared/presentation/widgets/section_header.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Note')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Capture one real learning.',
                subtitle: 'Do not just store information. Turn it into understanding.',
              ),
              const SizedBox(height: AppSpacing.lg),
              const NoteUCard(
                child: Column(
                  children: [
                    LearningInput(
                      title: 'What did I learn?',
                      placeholder: 'Explain the main idea in your own words.',
                    ),
                    SizedBox(height: AppSpacing.lg),
                    LearningInput(
                      title: 'Why does this matter?',
                      placeholder: 'Write why this lesson has value or meaning.',
                    ),
                    SizedBox(height: AppSpacing.lg),
                    LearningInput(
                      title: 'Where can I apply this?',
                      placeholder: 'Name a real situation where this learning becomes useful.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(label: 'Save Note', icon: Icons.check_rounded, onPressed: () {}),
              const SizedBox(height: AppSpacing.sm),
              SecondaryButton(label: 'Back to Home', icon: Icons.arrow_back_rounded, onPressed: () => context.pop()),
            ],
          ),
        ),
      ),
    );
  }
}
