import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.spaceXL),
                _buildHeader(),
                const SizedBox(height: AppDimensions.spaceXXL),
                _buildForm(controller),
                const SizedBox(height: AppDimensions.spaceXL),
                _buildLoginButton(controller),
                const SizedBox(height: AppDimensions.spaceL),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: AppDimensions.logoLarge,
          height: AppDimensions.logoLarge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(
                  alpha: AppColors.alphaMedium,
                ),
                blurRadius: AppDimensions.shadowBlurRadius,
                offset: Offset(0, AppDimensions.shadowOffset),
              ),
            ],
          ),
          child: const Icon(
            Icons.school,
            size: AppDimensions.iconXXL,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceL),
        Text(
          AppConstants.welcomeText,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spaceS),
        Text(
          AppConstants.appName,
          style: AppTextStyles.h1.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spaceS),
        Text(
          AppConstants.appDescriptionLogin,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildForm(LoginController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppConstants.nameLabel, style: AppTextStyles.label),
        const SizedBox(height: AppDimensions.spaceS),
        TextFormField(
          controller: controller.nameController,
          validator: controller.validateName,
          decoration: InputDecoration(
            hintText: AppConstants.namePlaceholder,
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
          ),
          textCapitalization: TextCapitalization.words,
          onTapOutside: (_) {
            FocusScope.of(Get.context!).unfocus();
          },
        ),
        const SizedBox(height: AppDimensions.spaceL),
        const Text(AppConstants.classLabel, style: AppTextStyles.label),
        const SizedBox(height: AppDimensions.spaceS),
        Obx(
          () => GestureDetector(
            onTap: controller.showClassPicker,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingM,
                vertical: AppDimensions.paddingS,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderLight),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                color: AppColors.surface,
              ),
              child: Row(
                children: [
                  const Icon(Icons.class_, color: AppColors.textSecondary),
                  const SizedBox(width: AppDimensions.spaceS),
                  Expanded(
                    child: Text(
                      controller.selectedClass.value != null
                          ? '${AppConstants.classPrefix} ${controller.selectedClass.value}'
                          : AppConstants.classPlaceholder,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: controller.selectedClass.value != null
                            ? AppColors.textPrimary
                            : AppColors.textHint,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(LoginController controller) {
    return Obx(
      () => ElevatedButton(
        onPressed: controller.isLoading.value ? null : controller.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.secondary,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          elevation: AppDimensions.cardElevationHigh,
          shadowColor: AppColors.primary.withValues(
            alpha: AppColors.alphaMedium,
          ),
        ),
        child: controller.isLoading.value
            ? const SizedBox(
                height: AppDimensions.iconS,
                width: AppDimensions.iconS,
                child: CircularProgressIndicator(
                  strokeWidth: AppDimensions.strokeWidthThin,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.secondary,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.login),
                  const SizedBox(width: AppDimensions.spaceS),
                  Text(
                    AppConstants.loginButtonText,
                    style: AppTextStyles.buttonLarge,
                  ),
                ],
              ),
      ),
    );
  }
}
