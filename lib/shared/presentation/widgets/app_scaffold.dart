import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.currentRoute,
    required this.children,
    this.showNavigation = true,
  });

  final String currentRoute;
  final List<Widget> children;
  final bool showNavigation;

  int get _selectedIndex {
    return switch (currentRoute) {
      AppRoutes.review => 1,
      AppRoutes.identity => 2,
      AppRoutes.settings => 3,
      _ => 0,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
      bottomNavigationBar: showNavigation
          ? NavigationBar(
              selectedIndex: _selectedIndex,
              backgroundColor: AppColors.surface,
              indicatorColor: AppColors.primarySoft,
              onDestinationSelected: (index) {
                final route = switch (index) {
                  1 => AppRoutes.review,
                  2 => AppRoutes.identity,
                  3 => AppRoutes.settings,
                  _ => AppRoutes.home,
                };
                context.go(route);
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.refresh_rounded), label: 'Review'),
                NavigationDestination(icon: Icon(Icons.auto_awesome_rounded), label: 'Identity'),
                NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Settings'),
              ],
            )
          : null,
    );
  }
}
