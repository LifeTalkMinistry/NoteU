import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/noteu_card.dart';
import '../../../../shared/presentation/widgets/section_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentRoute: AppRoutes.settings,
      children: const [
        SectionHeader(
          title: 'Settings',
          subtitle: 'Simple controls only. No account, no cloud, no social features.',
        ),
        SizedBox(height: AppSpacing.lg),
        _SettingTile(icon: Icons.file_upload_rounded, title: 'Export Backup'),
        SizedBox(height: AppSpacing.sm),
        _SettingTile(icon: Icons.file_download_rounded, title: 'Import Backup'),
        SizedBox(height: AppSpacing.sm),
        _SettingTile(icon: Icons.contrast_rounded, title: 'Appearance'),
        SizedBox(height: AppSpacing.sm),
        _SettingTile(icon: Icons.info_outline_rounded, title: 'About NoteU'),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return NoteUCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: AppSpacing.md),
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
