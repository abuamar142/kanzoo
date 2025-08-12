import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/services/storage_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == AppConstants.logoutMenuText) {
                await StorageService.logout();
                Get.offAllNamed(AppRoutes.login);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: AppConstants.logoutMenuText,
                child: Row(
                  children: [
                    Icon(Icons.logout, size: AppDimensions.iconS),
                    SizedBox(width: AppDimensions.spaceS),
                    Text(AppConstants.logoutMenuText),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<Map<String, String?>>(
        future: StorageService.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData =
              snapshot.data ??
              {AppConstants.nameLabel: null, AppConstants.classLabel: null};

          final userName =
              userData[AppConstants.nameKey] ?? AppConstants.defaultUserName;

          final userClass = userData[AppConstants.classKey] ?? '';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Message
                _buildWelcomeCard(userName, userClass),

                const SizedBox(height: AppDimensions.spaceL),

                // Quick Actions
                _buildQuickActions(),

                const SizedBox(height: AppDimensions.spaceL),

                // School Info Card
                _buildSchoolInfoCard(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWelcomeCard(String userName, String userClass) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: AppColors.alphaMedium),
            blurRadius: AppDimensions.spaceL,
            offset: const Offset(0, AppDimensions.spaceS),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimensions.paddingS),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(
                    alpha: AppColors.alphaLight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.waving_hand,
                  color: AppColors.secondary,
                  size: AppDimensions.iconL,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.greetingArabic,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.secondary.withValues(
                          alpha: AppColors.alphaVeryHigh,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spaceXS),
                    Text(
                      userName,
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (userClass.isNotEmpty)
                      Text(
                        '${AppConstants.classPrefix} $userClass',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.secondary.withValues(
                            alpha: AppColors.alphaHigh,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceM),
          Text(
            AppConstants.welcomeHomeMessage,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.secondary.withValues(
                alpha: AppColors.alphaVeryHigh,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.mainMenuTitle,
          style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: AppDimensions.spaceM),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: Icons.book,
                title: AppConstants.materialsTitle,
                subtitle: AppConstants.materialsSubtitle,
                color: AppColors.primary,
                onTap: () {
                  // TODO: Navigate to materials
                  AppSnackbar.showComingSoon(AppConstants.materialsTitle);
                },
              ),
            ),
            const SizedBox(width: AppDimensions.spaceM),
            Expanded(
              child: _buildActionCard(
                icon: Icons.quiz,
                title: AppConstants.exerciseTitle,
                subtitle: AppConstants.exerciseSubtitle,
                color: AppColors.arabicGreen,
                onTap: () {
                  // TODO: Navigate to exercises
                  AppSnackbar.showComingSoon(AppConstants.exerciseTitle);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(
                alpha: AppColors.alphaVeryLow,
              ),
              blurRadius: AppDimensions.spaceS,
              offset: const Offset(0, AppDimensions.spaceXS),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.paddingM),
              decoration: BoxDecoration(
                color: color.withValues(alpha: AppColors.alphaLow),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: AppDimensions.iconL),
            ),
            const SizedBox(height: AppDimensions.paddingS),
            Text(
              title,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceXS),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.borderLight),
      ),
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
    );
  }
}
