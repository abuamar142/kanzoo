import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/chapter_progress_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/string_extensions.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/materials/components/material_card.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/shared.dart';

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
                    Icon(
                      Icons.logout,
                      size: AppDimensions.iconM,
                      color: AppColors.error,
                    ),
                    SizedBox(width: AppDimensions.spaceS),
                    Text(AppConstants.logoutMenuText),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
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
                _buildGreeting(userName, userClass),

                const SizedBox(height: AppDimensions.spaceL),

                // Materials List
                _buildMaterialsList(),

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

  Widget _buildGreeting(String userName, String userClass) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: AppColors.alpha20),
            blurRadius: AppDimensions.spaceM,
            offset: const Offset(0, AppDimensions.spaceXS),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppConstants.greeting} ${userName.capitalizeWords()}',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.surface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (userClass.isNotEmpty) ...[
                  Text(
                    '${AppConstants.classPrefix} $userClass',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.surface.withValues(
                        alpha: AppColors.alpha90,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: AppDimensions.spaceM),
                Text(
                  AppConstants.welcomeHomeMessage,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.surface.withValues(
                      alpha: AppColors.alpha90,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.menu_book,
              color: AppColors.primary,
              size: AppDimensions.iconM,
            ),
            const SizedBox(width: AppDimensions.spaceS),
            Text(
              AppConstants.materialsTitle,
              style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spaceM),
        _buildChaptersList(),
      ],
    );
  }

  Widget _buildChaptersList() {
    final chapters = Chapter.all;

    return Column(
      children: chapters.map((chapter) {
        final isUnlocked = ChapterProgressService.isChapterUnlocked(chapter);
        final completionPercentage =
            ChapterProgressService.getChapterCompletionPercentage(chapter);

        return MaterialCard(
          title: chapter.title,
          subtitle: isUnlocked
              ? 'Materi pembelajaran bahasa Arab${completionPercentage > 0 ? ' (${completionPercentage.toStringAsFixed(0)}% selesai)' : ''}'
              : 'Bab terkunci - Selesaikan bab sebelumnya terlebih dahulu',
          icon: isUnlocked ? Icons.menu_book : Icons.lock,
          colors: isUnlocked
              ? chapter.gradientColors
              : [AppColors.borderLight, AppColors.textHint],
          onTap: () => _handleChapterTap(chapter),
          isEnabled: isUnlocked,
        );
      }).toList(),
    );
  }

  void _handleChapterTap(Chapter chapter) {
    final isUnlocked = ChapterProgressService.isChapterUnlocked(chapter);

    if (isUnlocked) {
      Get.toNamed(AppRoutes.materialKind, arguments: {'chapter': chapter});
    }
    // For locked chapters, do nothing - the description is already shown in the card
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
