import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Message
              const Text(
                'Selamat Datang di Kanzoo!',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppDimensions.spaceM),

              const Text(
                'Aplikasi Pembelajaran Bahasa Arab untuk MTs',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppDimensions.spaceXL),

              // School Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.school,
                        size: AppDimensions.iconXL,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: AppDimensions.spaceM),
                      Text(
                        AppConstants.schoolName,
                        style: AppTextStyles.h4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spaceS),
                      Text(
                        AppConstants.teacherName,
                        style: AppTextStyles.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppDimensions.spaceXL),

              // Quick Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Navigate to materials
                      },
                      icon: const Icon(Icons.book),
                      label: const Text('Materi'),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceM),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Navigate to exercises
                      },
                      icon: const Icon(Icons.quiz),
                      label: const Text('Latihan'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
