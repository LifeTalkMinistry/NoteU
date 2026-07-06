import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          background: AppColors.background,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, height: 1.12, color: AppColors.textPrimary),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.16, color: AppColors.textPrimary),
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.22, color: AppColors.textPrimary),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
          bodyLarge: TextStyle(fontSize: 16, height: 1.5, color: AppColors.textPrimary),
          bodyMedium: TextStyle(fontSize: 14, height: 1.45, color: AppColors.textSecondary),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
          ),
          contentPadding: const EdgeInsets.all(18),
        ),
      );
}
