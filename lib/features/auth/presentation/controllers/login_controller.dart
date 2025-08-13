import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/services/storage_service.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Observable variables
  final selectedClass = Rx<String?>(null);
  final isLoading = false.obs;

  // List kelas yang tersedia
  final List<String> availableClasses = AppConstants.availableClasses;

  @override
  void onInit() {
    super.onInit();
    _checkIfAlreadyLoggedIn();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void _checkIfAlreadyLoggedIn() async {
    final isLoggedIn = await StorageService.isUserLoggedIn();
    if (isLoggedIn) {
      // Jika sudah login, langsung ke home
      Get.offAllNamed(AppRoutes.home);
    }
  }

  void selectClass(String className) {
    selectedClass.value = className;
    Get.back(); // Close bottom sheet
  }

  void showClassPicker() {
    Get.bottomSheet(
      Container(
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.6, // Maksimal 60% dari tinggi layar
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusL),
            topRight: Radius.circular(AppDimensions.radiusL),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(alpha: AppColors.alpha30),
              blurRadius: AppDimensions.shadowBlurRadius,
              offset: const Offset(0, -AppDimensions.paddingXS),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: AppDimensions.spaceM),
              width: AppDimensions.spaceXXL,
              height: AppDimensions.spaceXS,
              decoration: BoxDecoration(
                color: AppColors.borderLight,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.paddingS),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(
                        alpha: AppColors.alpha05,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                    ),
                    child: const Icon(
                      Icons.class_,
                      size: AppDimensions.iconM,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceM),
                  Text(
                    AppConstants.classPickerTitle,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Class grid - lebih compact
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    crossAxisSpacing: AppDimensions.spaceM,
                    mainAxisSpacing: AppDimensions.spaceM,
                  ),
                  itemCount: availableClasses.length,
                  itemBuilder: (context, index) {
                    final className = availableClasses[index];
                    return Material(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusM,
                      ),
                      color: AppColors.primary.withValues(
                        alpha: AppColors.alpha05,
                      ),
                      child: InkWell(
                        onTap: () => selectClass(className),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusM,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusM,
                            ),
                            border: Border.all(
                              color: AppColors.borderLight,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${AppConstants.classPrefix} $className',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: AppDimensions.spaceL),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppConstants.nameEmptyError;
    }
    if (value.trim().length < AppConstants.nameMinLength) {
      return AppConstants.nameMinLengthError;
    }
    return null;
  }

  String? validateClass() {
    if (selectedClass.value == null) {
      return AppConstants.classEmptyError;
    }
    return null;
  }

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (validateClass() != null) {
      AppSnackbar.showError(message: AppConstants.classEmptyError);
      return;
    }

    isLoading.value = true;

    try {
      final success = await StorageService.saveUserData(
        name: nameController.text.trim(),
        className: selectedClass.value!,
      );

      if (success) {
        AppSnackbar.showSuccess(
          message:
              '${AppConstants.loginSuccessMessage}, ${nameController.text.trim()}!',
        );

        // Navigate to home
        Get.offAllNamed(AppRoutes.home);
      } else {
        throw Exception(AppConstants.saveDataError);
      }
    } catch (e) {
      AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
