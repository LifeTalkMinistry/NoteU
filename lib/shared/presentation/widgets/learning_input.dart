import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';

class LearningInput extends StatelessWidget {
  const LearningInput({
    super.key,
    required this.title,
    required this.placeholder,
    this.controller,
  });

  final String title;
  final String placeholder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        TextFormField(
          controller: controller,
          minLines: 4,
          maxLines: 7,
          decoration: InputDecoration(hintText: placeholder),
        ),
      ],
    );
  }
}
